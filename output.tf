# 01-vpc-igw
output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The ID of the created VPC from the module"
}
output "vpc_cidr" {
  value       = module.vpc.vpc_cidr
  description = "The CIDR block of the VPC from the module"
}
output "internet_gateway_id" {
  value       = module.vpc.internet_gateway_id
  description = "The ID of the created Internet Gateway from the module"
}

# 02-subnets
output "public_subnet_a_id" {
  value       = module.subnets.public_subnet_a_id
  description = "The ID of the public subnet A from the module"
}
output "public_subnet_b_id" {
  value       = module.subnets.public_subnet_b_id
  description = "The ID of the public subnet B from the module"
}
output "private_subnet_a_id" {
  value       = module.subnets.private_subnet_a_id
  description = "The ID of the private subnet A from the module"
}
output "private_subnet_b_id" {
  value       = module.subnets.private_subnet_b_id
  description = "The ID of the private subnet B from the module"
}

# 03-natgw-eip
output "nat_eip_a_id" {
  value       = module.natgw.nat_eip_a_id
  description = "The ID of the Elastic IP for NAT Gateway A from the module"
}
output "nat_eip_b_id" {
  value       = module.natgw.nat_eip_b_id
  description = "The ID of the Elastic IP for NAT Gateway B from the module"
}
output "nat_gateway_a_id" {
  value       = module.natgw.nat_gateway_a_id
  description = "The ID of NAT Gateway A from the module"
}
output "nat_gateway_b_id" {
  value       = module.natgw.nat_gateway_b_id
  description = "The ID of NAT Gateway B from the module"
}

# 04-route_tables
output "public_route_table_id" {
  value       = module.route_tables.public_route_table_id
  description = "The ID of the public route table from the module"
}
output "public_route_table_association_a_id" {
  value       = module.route_tables.public_route_table_association_a_id
  description = "The ID of the route table association for public subnet A from the module"
}
output "public_route_table_association_b_id" {
  value       = module.route_tables.public_route_table_association_b_id
  description = "The ID of the route table association for public subnet B from the module"
}
output "private_route_table_a_id" {
  value       = module.route_tables.private_route_table_a_id
  description = "The ID of the private route table for NAT Gateway A from the module"
}
output "private_route_table_association_a_id" {
  value       = module.route_tables.private_route_table_association_a_id
  description = "The ID of the route table association for private subnet A from the module"
}
output "private_route_table_b_id" {
  value       = module.route_tables.private_route_table_b_id
  description = "The ID of the private route table for NAT Gateway B from the module"
}
output "private_route_table_association_b_id" {
  value       = module.route_tables.private_route_table_association_b_id
  description = "The ID of the route table association for private subnet B from the module"
}

# 05-security_groups
output "public_security_group_id" {
  description = "The ID of the public security group."
  value       = module.security_groups.public_sg_id
}
output "private_security_group_id" {
  description = "The ID of the private security group."
  value       = module.security_groups.private_sg_id
}

# 06-instances-Bastion
output "private_key_path" {
  value       = module.instances-bastion.private_key_path
  description = "The name of the bastion key pair from the module"
  sensitive   = true
}
output "bastion_private_key" {
  value       = module.instances-bastion.bastion_private_key
  description = "The private key for the bastion instance from the module"
  sensitive   = true
}
output "public_instance_a_id" {
  value       = module.instances-bastion.public_instance_a_id
  description = "The ID of the public instance A from the module"
}
output "public_instance_b_id" {
  value       = module.instances-bastion.public_instance_b_id
  description = "The ID of the public instance B from the module"
}
output "private_instance_a_id" {
  value       = module.instances-bastion.private_instance_a_id
  description = "The ID of the private instance A from the module"
}
output "private_instance_b_id" {
  value       = module.instances-bastion.private_instance_b_id
  description = "The ID of the private instance B from the module"
}

# 07-ALB
output "alb_arn" {
  value       = module.alb.alb_arn
  description = "The ARN of the Application Load Balancer from the module"
}
output "alb_dns_name" {
  value       = module.alb.alb_dns_name
  description = "The DNS name of the Application Load Balancer from the module"
}
output "target_group_arn" {
  value       = module.alb.target_group_arn
  description = "The ARN of the target group from the module"
}
output "alb_listener_arn" {
  value       = module.alb.alb_listener_arn
  description = "The ARN of the ALB listener from the module"
}

# 08-auto_scaling_group
output "launch_configuration_id" {
  value       = module.autoscaling.launch_configuration_id
  description = "The ID of the launch configuration from the module"
}
output "autoscaling_group_id" {
  value       = module.autoscaling.autoscaling_group_id
  description = "The ID of the Auto Scaling Group from the module"
}
output "autoscaling_group_arn" {
  value       = module.autoscaling.autoscaling_group_arn
  description = "The ARN of the Auto Scaling Group from the module"
}
output "autoscaling_group_name" {
  value       = module.autoscaling.autoscaling_group_name
  description = "The name of the Auto Scaling Group from the module"
}