provider "aws" {
    region = "us-east-1"
    access_key = "AKIA4HH4NCCWFIAFAO5J"
    secret_key = "**************"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_vpc" "myvpc2" {
    cidr_block = "192.168.0.0/24"
}
