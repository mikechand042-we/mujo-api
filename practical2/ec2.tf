
resource "aws_iam_role" "nodejs_ssm" {
  name = "nodejs-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "nodejs_ssm" {
  role       = aws_iam_role.nodejs_ssm.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "nodejs_ssm" {
  name = "nodejs-ssm-profile"
  role = aws_iam_role.nodejs_ssm.name
}

resource "aws_instance" "nodejs_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.nodejs_sg.id]
  subnet_id              = var.subnet_id
  iam_instance_profile   = aws_iam_instance_profile.nodejs_ssm.name

  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }

  tags = {
    Name        = "nodejs-deployment-server"
    Environment = "Practical-2"
  }
}

resource "aws_iam_role_policy" "nodejs_ssm_parameters" {
  name = "nodejs-ssm-parameter-read"
  role = aws_iam_role.nodejs_ssm.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ssm:GetParameter"
        ]
        Resource = "arn:aws:ssm:us-east-1:824232273986:parameter/practical2/*"
      }
    ]
  })
}
