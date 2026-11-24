output "instance_id" {
  description = "Deployment EC2 Instance ID"
  value       = aws_instance.nodejs_server.id
}

output "public_ip" {
  description = "Deployment EC2 Public IP"
  value       = aws_instance.nodejs_server.public_ip
}

output "public_dns" {
  description = "Deployment EC2 Public DNS"
  value       = aws_instance.nodejs_server.public_dns
}
output "private_ip" {
  description = "Deployment EC2 Private IP"
  value       = aws_instance.nodejs_server.private_ip
}