## Route Table Module

This module creates route tables for public and private subnets in an AWS VPC. It ensures that public subnets have access to the internet via an Internet Gateway and that private subnets can route traffic through NAT Gateways.

### Features

- **Public Route Table**: A route table is created for public subnets, directing internet traffic through the specified Internet Gateway.
- **Associations**: Public and private subnets are associated with their respective route tables to control routing behavior.
- **Private Route Tables**: Separate route tables for each private subnet route traffic through their designated NAT Gateways.

### Inputs

- `vpc_id`: The ID of the VPC where the route tables will be created. This value is obtained from the outputs of the **01-vpc-igw** module.
- `internet_gateway_id`: The ID of the Internet Gateway used for public route table routing. This value is obtained from the outputs of the **01-vpc-igw** module.
- `nat_gateway_a_id`: The ID of the primary NAT Gateway for the private route table associated with subnet A. This value is obtained from the outputs of the **03-natgw-eip** module.
- `nat_gateway_b_id`: The ID of the secondary NAT Gateway for the private route table associated with subnet B. This value is obtained from the outputs of the **03-natgw-eip** module.
- `public_subnet_a_id`: The ID of public subnet A. This value is obtained from the outputs of the **02-subnets** module.
- `public_subnet_b_id`: The ID of public subnet B. This value is obtained from the outputs of the **02-subnets** module.
- `private_subnet_a_id`: The ID of private subnet A. This value is obtained from the outputs of the **02-subnets** module.
- `private_subnet_b_id`: The ID of private subnet B. This value is obtained from the outputs of the **02-subnets** module.

### Outputs

- `public_route_table_id`: The ID of the public route table.
- `public_route_table_association_a_id`: The ID of the route table association for public subnet A.
- `public_route_table_association_b_id`: The ID of the route table association for public subnet B.
- `private_route_table_a_id`: The ID of the private route table for NAT Gateway A.
- `private_route_table_association_a_id`: The ID of the route table association for private subnet A.
- `private_route_table_b_id`: The ID of the private route table for NAT Gateway B.
- `private_route_table_association_b_id`: The ID of the route table association for private subnet B.

### Usage

To use this module, include it in your Terraform configuration and provide the necessary IDs as inputs, which are outputs from the referenced modules.
