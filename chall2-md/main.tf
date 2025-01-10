provider "aws" {
  region = "us-east-1"
  access_key = "AKIA4HH4NCCWFIAFAO5J"
  secret_key = "**************"
}

resource "aws_instance" "dbserver" {
  ami = "ami-01c647eace872fc02"
  instance_type = "t2.micro"
  tags = {
    Name = "dbserver"
  }
}

resource "aws_instance" "webserver" {
  ami = "ami-01c647eace872fc02"
  instance_type = "t2.micro"
  user_data = file("startup.sh")
  security_groups = [aws_security_group.web_sq.name]
  tags = {
    Name = "webserver"
  }
}

resource "aws_eip" "web_public_ip" {
  instance = aws_instance.webserver.id
}

resource "aws_security_group" "web_sq" {
  name = "Web server security group"
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.web_sq.id
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port   = 80
  to_port     = 80
}
resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.web_sq.id
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port   = 443
  to_port     = 443
}

output "dbserver_private_ip" {
  value = aws_instance.dbserver.private_ip
}