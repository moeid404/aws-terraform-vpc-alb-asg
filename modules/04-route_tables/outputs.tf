output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.public.id
}

output "public_route_table_association_a_id" {
  description = "The ID of the route table association for public subnet A"
  value       = aws_route_table_association.public_subnet_a.id
}

output "public_route_table_association_b_id" {
  description = "The ID of the route table association for public subnet B"
  value       = aws_route_table_association.public_subnet_b.id
}

output "private_route_table_a_id" {
  description = "The ID of the private route table for NAT Gateway A"
  value       = aws_route_table.private-nat_a.id
}

output "private_route_table_association_a_id" {
  description = "The ID of the route table association for private subnet A"
  value       = aws_route_table_association.private_subnet_a.id
}

output "private_route_table_b_id" {
  description = "The ID of the private route table for NAT Gateway B"
  value       = aws_route_table.private-nat_b.id
}

output "private_route_table_association_b_id" {
  description = "The ID of the route table association for private subnet B"
  value       = aws_route_table_association.private_subnet_b.id
}
