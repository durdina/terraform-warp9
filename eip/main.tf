provider "aws" {
    region = "us-east-1"
    access_key = "AKIA4HH4NCCWFIAFAO5J"
    secret_key = "**************"
}
resource "aws_instance" "ec3" {
    ami = "ami-01c647eace872fc02"
    instance_type = "t2.micro"
}

resource "aws_eip" "elasticeip" {
    instance = aws_instance.ec3.id
}

resource "aws_eip" "elasticeip2" {
}

output "EIP" {
    value = aws_eip.elasticeip.public_ip
}

output "ec3_idA" {
    value = aws_instance.ec3.id
}
