output "instance_id" {
  value = aws_instance.n8n.id
}

output "region" {
  value = var.region
}

output "public_ip" {
  value = aws_eip.n8n.public_ip
}

output "landing_page" {
  value = "https://${local.base_domain}"
}

output "team_urls" {
  value = { for t in var.teams : t => "https://${t}.${local.base_domain}" }
}

output "next_steps" {
  value = <<-EOT
    Bootstrap takes ~4-6 minutes (Docker install, image pull, TLS certs).
    Then each team URL shows n8n's "Set up owner account" screen to its first visitor.

    Watch progress:   make logs      (ends with "bootstrap finished")
    Check health:     make status
    ${local.use_ssh ? "SSH:              ssh ubuntu@${aws_eip.n8n.public_ip}" : "Shell:            aws ssm start-session --region ${var.region} --target ${aws_instance.n8n.id}"}
    Tear down:        terraform destroy
  EOT
}
