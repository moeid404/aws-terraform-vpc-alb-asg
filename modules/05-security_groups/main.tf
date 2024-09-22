# Create Security Group for Public Instances
resource "aws_security_group" "public_sg" {
  vpc_id = var.vpc_id

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public-sg"
  }
}

# Create Security Group for Private Instances
resource "aws_security_group" "private_sg" {
  vpc_id = var.vpc_id

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  ingress {
    # Allow SSH from specific public subnets to private instances
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    security_groups = [aws_security_group.public_sg.id]
  }

  tags = {
    Name = "private-sg"
  }
}