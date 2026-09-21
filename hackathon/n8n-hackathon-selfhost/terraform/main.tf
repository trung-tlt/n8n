locals {
  base_domain = "${var.subdomain}.${var.domain}"
  name        = "n8n-hackathon"
  use_ssh     = var.ssh_public_key != ""
}

# ---------------------------------------------------------------------------
# Lookups: hosted zone, default VPC, latest Ubuntu 24.04 LTS AMI
# ---------------------------------------------------------------------------
data "aws_route53_zone" "main" {
  name         = var.domain
  private_zone = false
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
  filter {
    name   = "default-for-az"
    values = ["true"]
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# ---------------------------------------------------------------------------
# Network: security group + Elastic IP
# ---------------------------------------------------------------------------
resource "aws_security_group" "n8n" {
  name        = local.name
  description = "n8n hackathon host: HTTP/HTTPS public, SSH restricted"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "HTTP (ACME challenge + redirect to HTTPS)"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each = local.use_ssh ? [1] : []
    content {
      description = "SSH (admin only)"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = var.admin_cidrs
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_eip" "n8n" {
  domain = "vpc"
  tags   = { Name = local.name }
}

# ---------------------------------------------------------------------------
# IAM: allow SSM Session Manager / Run Command (no SSH key required)
# ---------------------------------------------------------------------------
resource "aws_iam_role" "n8n" {
  name = "${local.name}-ec2"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.n8n.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "n8n" {
  name = "${local.name}-ec2"
  role = aws_iam_role.n8n.name
}

resource "aws_key_pair" "n8n" {
  count      = local.use_ssh ? 1 : 0
  key_name   = local.name
  public_key = var.ssh_public_key
}

# ---------------------------------------------------------------------------
# The host
# ---------------------------------------------------------------------------
resource "aws_instance" "n8n" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = data.aws_subnets.default.ids[0]
  vpc_security_group_ids      = [aws_security_group.n8n.id]
  iam_instance_profile        = aws_iam_instance_profile.n8n.name
  key_name                    = local.use_ssh ? aws_key_pair.n8n[0].key_name : null
  associate_public_ip_address = true

  root_block_device {
    volume_type           = "gp3"
    volume_size           = var.root_volume_gb
    delete_on_termination = true
  }

  metadata_options {
    http_tokens = "required" # IMDSv2
  }

  # Never replace the host implicitly (a script tweak or a new Ubuntu AMI must not
  # wipe 10 teams mid-event). To rebuild on purpose: make rebuild
  # (= terraform apply -replace=aws_instance.n8n). Script-only fixes: make push-scripts.
  lifecycle {
    ignore_changes = [user_data, ami]
  }

  user_data = templatefile("${path.module}/user-data.sh.tftpl", {
    teams       = join("\n", var.teams)
    base_domain = local.base_domain
    acme_email  = var.acme_email
    n8n_image   = var.n8n_image
    timezone    = var.timezone
    # Scripts are shipped gzip+base64 so the whole payload stays under the 16 KB user-data limit.
    gen_compose_b64 = base64gzip(file("${path.module}/../scripts/gen-compose.sh"))
    reset_team_b64  = base64gzip(file("${path.module}/../scripts/reset-team.sh"))
    reset_all_b64   = base64gzip(file("${path.module}/../scripts/reset-all.sh"))
  })

  tags = { Name = local.name }
}

resource "aws_eip_association" "n8n" {
  instance_id   = aws_instance.n8n.id
  allocation_id = aws_eip.n8n.id
}

# ---------------------------------------------------------------------------
# DNS: one A record per team + a landing page on the bare sub-zone
# ---------------------------------------------------------------------------
resource "aws_route53_record" "team" {
  for_each = toset(var.teams)

  zone_id = data.aws_route53_zone.main.zone_id
  name    = "${each.value}.${local.base_domain}"
  type    = "A"
  ttl     = 60
  records = [aws_eip.n8n.public_ip]
}

resource "aws_route53_record" "landing" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = local.base_domain
  type    = "A"
  ttl     = 60
  records = [aws_eip.n8n.public_ip]
}
