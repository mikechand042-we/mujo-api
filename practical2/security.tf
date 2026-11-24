
resource "aws_security_group" "nodejs_sg" {
  name        = "lum"
  description = "Security group for Node.js deployment server"

  # SSH access
  # SSH access
  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
      var.my_ip,
      "172.31.1.243/32"
    ]
  }
  # Node.js application
  ingress {
    description = "Node.js application port"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  # Outbound access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "lum"
  }
}
