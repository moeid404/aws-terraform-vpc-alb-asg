## Security Group Module

This module creates security groups for both public and private instances within an AWS VPC. It defines rules that control inbound and outbound traffic, ensuring security and accessibility of resources.

### Features

- **Public Security Group**: 
  - Allows inbound SSH (port 22) from any IP address, which should be restricted to only those who have the SSH key to access the instances. 
  - Allows inbound HTTP (port 80) from any IP address.
  - Allows all outbound traffic.

- **Private Security Group**: 
  - Allows inbound SSH (port 22) from the public security group, enabling secure access from public instances.
  - Allows all outbound traffic.

### Inputs

- `vpc_id`: The ID of the VPC where the security groups will be created. This value is obtained from the outputs of the **01-vpc-igw** module.

### Outputs

- `public_sg_id`: The ID of the public security group.
- `private_sg_id`: The ID of the private security group.

### Usage

To use this module, include it in your Terraform configuration and provide the necessary VPC ID as input, which is an output from the referenced module.