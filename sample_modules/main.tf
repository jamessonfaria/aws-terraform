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
  region = "us-east-1"
}

resource "random_pet" "this" {
  length = 5
}

module "bucket" {
  source = "./s3_module"
  name   = random_pet.this.id

  versioning = {
    enabled = true
  }
}

resource "random_pet" "website" {
  length = 5
}

module "website" {
  source = "./s3_module"
  name   = random_pet.website.id
  acl    = "public-read"
  files  = "${path.root}/website"

  website = {
    index_document = "index.html"
    error_document = "error.html"
  }

  policy = <<EOT
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "PublicReadGetObject",
                "Effect": "Allow",
                "Principal": "*",
                "Action": [
                    "s3:GetObject"
                ],
                "Resource": [
                    "arn:aws:s3:::${random_pet.website.id}/*"
                ]
            }
        ]
    }
    EOT
}

