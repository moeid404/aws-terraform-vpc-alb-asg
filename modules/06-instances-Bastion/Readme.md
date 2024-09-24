# Bastion Key Terraform Module

## Purpose
This Terraform module sets up a bastion host with a secure key pair and provisions EC2 instances in both public and private subnets on AWS. It automates the generation of an RSA key pair and configures instances with the necessary user data for SSH access.

## Features
- **RSA Key Pair Generation**: Automatically generates a secure RSA key pair for the bastion host.
- **EC2 Instance Provisioning**: Launches EC2 instances in specified public and private subnets.
- **User Data Configuration**: Installs the private key on the instances and sets appropriate permissions.

## Inputs
- `ami` (string): The Amazon Machine Image (AMI) ID to use for the EC2 instances. Default is `"ami-0e86e20dae9224db8"` (for Ubuntu).
- `private_key_path` (string): The path where the bastion private key will be saved. Default is `"/home/ubuntu/.ssh/bastion_key.pem"`.
- `key_owner` (string): The owner of the private key file. Default is `"ubuntu"`.
- `instance_type` (string): The type of EC2 instance to launch. Default is `"t2.micro"`.
- `public_subnet_a_id` (string): The ID of Public Subnet A. This value is obtained from the outputs of the **02-subnets** module.
- `public_subnet_b_id` (string): The ID of Public Subnet B. This value is obtained from the outputs of the **02-subnets** module.
- `private_subnet_a_id` (string): The ID of Private Subnet A. This value is obtained from the outputs of the **02-subnets** module.
- `private_subnet_b_id` (string): The ID of Private Subnet B. This value is obtained from the outputs of the **02-subnets** module.
- `public_sg_id` (string): The ID of the public security group. This value is obtained from the outputs of the **05-security_groups** module.
- `private_sg_id` (string): The ID of the private security group. This value is obtained from the outputs of the **05-security_groups** module.

## Outputs
- `key_pair_name`: The name of the bastion key pair.
- `private_key_path`: The path of the bastion private key (sensitive).
- `bastion_private_key`: The private key for the bastion instance (sensitive).
- `public_instance_a_id`: The ID of the public instance A.
- `public_instance_b_id`: The ID of the public instance B.
- `private_instance_a_id`: The ID of the private instance A.
- `private_instance_b_id`: The ID of the private instance B.

## Usage
To use this module, include it in your Terraform configuration and provide the necessary input variables, such as the public and private subnet IDs, which are outputs from the referenced VPC module.
