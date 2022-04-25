locals {
  ip_file_path = "ips.json"

  common_tags = {
    Name        = "My bucket"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = "Jamesson"
    updatedAt   = "2022-04-22"
  }
}