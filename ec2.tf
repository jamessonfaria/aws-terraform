resource "aws_instance" "web" {
  ami           = "ami-0f9fc25dd2506cf6d"
  instance_type = "t2.micro"

  tags = var.instance_tags
}