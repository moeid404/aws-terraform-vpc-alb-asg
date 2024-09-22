# Outputs for the module
output "nat_eip_a_id" {
  description = "The ID of the Elastic IP for NAT Gateway A"
  value       = aws_eip.nat_eip_a.id
}

output "nat_eip_b_id" {
  description = "The ID of the Elastic IP for NAT Gateway B"
  value       = aws_eip.nat_eip_b.id
}

output "nat_gateway_a_id" {
  description = "The ID of NAT Gateway A"
  value       = aws_nat_gateway.nat_a.id
}

output "nat_gateway_b_id" {
  description = "The ID of NAT Gateway B"
  value       = aws_nat_gateway.nat_b.id
}