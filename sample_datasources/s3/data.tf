data "terraform_remote_state" "server" {
    backend = "s3"
    config = {
        bucket = "tfstate-963028648626"
        key    = "dev/remote-state/terraform.tfstate"
        region = "us-east-1"
    }
}
