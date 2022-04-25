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

  backend "s3" {
    bucket = "tfstate-963028648626"
    key    = "dev/remote-state/terraform.tfstate"
    region = "us-east-1"    
  }
}

provider "aws" {
  region = var.aws_region
}