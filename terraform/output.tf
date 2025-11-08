output "ec2_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}

output "ssh_command" {
  description = "Command to SSH into the EC2 instance"
  value       = "ssh -i ec2-key.pem ec2-user@${aws_instance.app_server.public_ip}"
}