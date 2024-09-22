output "key_pair_name" {
  description = "The name of the bastion key pair"
  value       = aws_key_pair.bastion_key.key_name  # Ensure this matches your key pair resource
}

output "private_key_path" {
  description = "The path of the bastion private key"
  value       = "./bastion_key.pem"
  sensitive   = true
}

output "bastion_private_key" {
  description = "The private key for the bastion instance"
  value       = tls_private_key.bastion_key.private_key_pem
  sensitive   = true
}

output "public_instance_a_id" {
  description = "The ID of the public instance A"
  value       = aws_instance.public_instance_a.id
}

output "public_instance_b_id" {
  description = "The ID of the public instance B"
  value       = aws_instance.public_instance_b.id
}

output "private_instance_a_id" {
  description = "The ID of the private instance A"
  value       = aws_instance.private_instance_a.id
}

output "private_instance_b_id" {
  description = "The ID of the private instance B"
  value       = aws_instance.private_instance_b.id
}
