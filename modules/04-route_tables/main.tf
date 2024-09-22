# Create Route Table >> Public Subnets
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }
  tags = {
    Name = "public-route-table"
  }
}

# Associate Public Subnets with Public Route Table
resource "aws_route_table_association" "public_subnet_a" {
  subnet_id      = var.public_subnet_a_id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_subnet_b" {
  subnet_id      = var.public_subnet_b_id
  route_table_id = aws_route_table.public.id
}

# Create Route Table >> Private Subnet_a >> (nat_a)
resource "aws_route_table" "private-nat_a" {
  vpc_id = var.vpc_id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_a_id
  }
  tags = {
    Name = "private-route-table-a"
  }
}

# Associate Private Subnet_a with Route Table >> private-nat_a
resource "aws_route_table_association" "private_subnet_a" {
  subnet_id      = var.private_subnet_a_id
  route_table_id = aws_route_table.private-nat_a.id
}

# Create Route Table >> Private Subnet_b >> (nat_b)
resource "aws_route_table" "private-nat_b" {
  vpc_id = var.vpc_id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_b_id
  }
  tags = {
    Name = "private-route-table-b"
  }
}

# Associate Private Subnet_b with Route Table >> private-nat_b
resource "aws_route_table_association" "private_subnet_b" {
  subnet_id      = var.private_subnet_b_id
  route_table_id = aws_route_table.private-nat_b.id
}
