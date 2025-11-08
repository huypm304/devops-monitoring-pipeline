terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" 
    }
  }
}

provider "aws" {
  region = "ap-southeast-1" 
}

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name   = "ec2-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "local_file" "ssh_key_file" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "ec2-key.pem"
  file_permission = "0400"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0b1957355e1e1d3e6" 
  instance_type = "t3.micro"              
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name      = aws_key_pair.key_pair.key_name
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              dnf install docker -y
              systemctl start docker
              usermod -a -G docker ec2-user
              dnf install git -y
              EOF

  tags = {
    Name = "app-server"
  }
}