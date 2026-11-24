
resource "aws_security_group" "nodejs_sg" {
  name        = "lum"
  description = "Security group for Node.js deployment server"

  # Public Node.js application access
  ingress {
    description = "Public access to Node.js application"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound internet access
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
