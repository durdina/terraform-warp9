provider "aws" {
    region = "us-east-1"
    access_key = "AKIA4HH4NCCWFIAFAO5J"
    secret_key = "**************"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
}