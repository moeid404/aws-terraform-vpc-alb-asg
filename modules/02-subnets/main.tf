# Create Public Subnets
resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_a_cidr
  availability_zone       = var.availability_zone_a
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-a"
  }
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_b_cidr
  availability_zone       = var.availability_zone_b
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-b"
  }
}

# Create Private Subnets
resource "aws_subnet" "private_subnet_a" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_a_cidr
  availability_zone = var.availability_zone_a
  tags = {
    Name = "private-subnet-a"
  }
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_b_cidr
  availability_zone = var.availability_zone_b
  tags = {
    Name = "private-subnet-b"
  }
}
