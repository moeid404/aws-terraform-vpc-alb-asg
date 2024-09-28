# Bastion Key
## Generate key pair private and public by Terraform
resource "tls_private_key" "bastion_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

## Public one will be used for generating the AWS key
## Private one will be generated and saved here locally.
resource "aws_key_pair" "bastion_key" {
  key_name   = "bastion_key"
  public_key = tls_private_key.bastion_key.public_key_openssh

provisioner "local-exec" {
  command = "echo '${tls_private_key.bastion_key.private_key_pem}' > ./bastion_key.pem && chmod 600 ./bastion_key.pem"
}

}

# Create EC2 Instances in Public Subnets
resource "aws_instance" "public_instance_a" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.bastion_key.key_name
  subnet_id              = var.public_subnet_a_id
  vpc_security_group_ids = [var.public_sg_id]
  tags = {
    Name = "public-instance-a"
  }
  user_data = <<-EOF
              #!/bin/bash
              mkdir -p /home/${var.key_owner}/.ssh
              echo '${tls_private_key.bastion_key.private_key_pem}' > ${var.private_key_path}
              chmod 600 ${var.private_key_path}
              chown ${var.key_owner}:${var.key_owner} ${var.private_key_path}
              EOF
}

resource "aws_instance" "public_instance_b" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.bastion_key.key_name
  subnet_id              = var.public_subnet_b_id
  vpc_security_group_ids = [var.public_sg_id]
  tags = {
    Name = "public-instance-b"
  }
  user_data = <<-EOF
              #!/bin/bash
              mkdir -p /home/${var.key_owner}/.ssh
              echo '${tls_private_key.bastion_key.private_key_pem}' > ${var.private_key_path}
              chmod 600 ${var.private_key_path}
              chown ${var.key_owner}:${var.key_owner} ${var.private_key_path}
              EOF
}

# Create EC2 Instances in Private Subnets
resource "aws_instance" "private_instance_a" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_a_id
  key_name               = aws_key_pair.bastion_key.key_name
  vpc_security_group_ids = [var.private_sg_id]
  tags = {
    Name = "private-instance-a"
  }
}

resource "aws_instance" "private_instance_b" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_b_id
  key_name               = aws_key_pair.bastion_key.key_name
  vpc_security_group_ids = [var.private_sg_id]
  tags = {
    Name = "private-instance-b"
  }
}