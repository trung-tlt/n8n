variable "region" {
  description = "AWS region (ap-southeast-1 = Singapore, closest to HCMC)."
  type        = string
  default     = "ap-southeast-1"
}

variable "domain" {
  description = "Route 53 hosted zone name (must already exist in this account)."
  type        = string
  default     = "n8nambassador.com"
}

variable "subdomain" {
  description = "Sub-zone under the domain. Teams get <team>.<subdomain>.<domain>."
  type        = string
  default     = "hackathon"
}

variable "teams" {
  description = "One n8n instance per entry. Lowercase letters/digits only (becomes a DNS label)."
  type        = list(string)
  default = [
    "lion", "tiger", "teddy", "hippo", "panda",
    "koala", "otter", "fox", "eagle", "dolphin",
  ]

  validation {
    condition     = alltrue([for t in var.teams : can(regex("^[a-z0-9]{2,20}$", t))])
    error_message = "Each team name must be 2-20 lowercase letters/digits (used as a DNS label and Docker service name)."
  }

  validation {
    condition     = length(distinct(var.teams)) == length(var.teams)
    error_message = "Team names must be unique."
  }
}

variable "acme_email" {
  description = "Email Let's Encrypt uses for certificate expiry notices."
  type        = string
}

variable "instance_type" {
  description = "10 n8n containers + Caddy idle at ~6-8 GB RAM. 16 GB / 4 vCPU is comfortable."
  type        = string
  default     = "m7i.xlarge"
}

variable "root_volume_gb" {
  type    = number
  default = 50
}

variable "n8n_image" {
  description = "Pin to a specific stable tag so every team runs the same build."
  type        = string
  default     = "docker.n8n.io/n8nio/n8n:2.38.7"
}

variable "timezone" {
  type    = string
  default = "Asia/Ho_Chi_Minh"
}

variable "ssh_public_key" {
  description = "Optional. Contents of your ~/.ssh/id_ed25519.pub. Leave empty to use SSM Session Manager only."
  type        = string
  default     = ""
}

variable "admin_cidrs" {
  description = "CIDRs allowed to SSH (port 22). Only used when ssh_public_key is set."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
