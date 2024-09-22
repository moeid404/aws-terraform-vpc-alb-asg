# Create Elastic IPs for NAT Gateways
resource "aws_eip" "nat_eip_a" {
  tags = {
    Name = "nat-eip-a"
  }
}

resource "aws_eip" "nat_eip_b" {
  tags = {
    Name = "nat-eip-b"
  }
}

# Create NAT Gateways
resource "aws_nat_gateway" "nat_a" {
  allocation_id = aws_eip.nat_eip_a.id
  subnet_id     = var.public_subnet_a_id
  tags = {
    Name = "nat-gateway-a"
  }
}

resource "aws_nat_gateway" "nat_b" {
  allocation_id = aws_eip.nat_eip_b.id
  subnet_id     = var.public_subnet_b_id
  tags = {
    Name = "nat-gateway-b"
  }
}