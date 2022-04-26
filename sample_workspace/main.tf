terraform {
  required_version = "1.1.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.11.0"
    }
  }

  backend "s3" {
    bucket = "tfstate-963028648626"
    key    = "remote-state/terraform.tfstate"
    region = "us-east-1"    
    dynamodb_table = "tflock-tfstate-963028648626"  
  }
}

provider "aws" {
  region = "us-east-1"
}

locals {
  env = terraform.workspace == "default" ? "dev" : terraform.workspace
}

resource "aws_instance" "web" {
  count = lookup(var.instance, local.env)["number"]

  ami           = lookup(var.instance, local.env)["ami"]
  instance_type = lookup(var.instance, local.env)["type"]

  tags = {
    Name = "Minha máquina web ${local.env}"
    Env  = local.env
  }
}