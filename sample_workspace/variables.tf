variable "aws_region" {
  description = "AWS region where the resources will be created"

  type = object({
    dev  = string
    prod = string
  })

  default = {
    dev  = "us-east-1"
    prod = "us-east-2"
  }
}

variable "instance" {
  description = "Instance configuration per workspace"

  type = object({
    dev = object({
      ami    = string
      type   = string
      number = number
    })
    prod = object({
      ami    = string
      type   = string
      number = number
    })
  })

  default = {
    dev = {
      ami    = "ami-04505e74c0741db8d"
      type   = "t1.micro"
      number = 1
    }
    prod = {
      ami    = "ami-04505e74c0741db8d"
      type   = "t2.micro"
      number = 3
    }
  }
}