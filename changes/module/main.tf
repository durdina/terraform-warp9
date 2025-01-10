provider "aws" {
    region = "us-east-1"
    access_key = "AKIA4HH4NCCWFIAFAO5J"
    secret_key = "**************"
}

module "ec2" {
    source = "./ec2"
    for_each = toset(["dev", "test", "prod"])
}
