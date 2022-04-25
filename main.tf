terraform {
  required_version = "1.1.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.11.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.3"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

/*resource "aws_instance" "web" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  tags = var.instance_tags
}*/