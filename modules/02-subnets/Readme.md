## Subnet Module

This module provisions both public and private subnets within a specified Virtual Private Cloud (VPC) in AWS, facilitating the organization of resources and control over network accessibility.

### Features

- **Public Subnets**: Two public subnets are created, each configured to automatically assign public IP addresses to instances launched within them. This allows resources in these subnets to communicate with the internet.
- **Private Subnets**: Two private subnets are created, which do not have direct internet access, ensuring enhanced security for sensitive resources.

### Inputs

- `vpc_id`: The ID of the VPC where the subnets will be created.  This value is obtained from the outputs of the **01-vpc-igw** module.
- `public_subnet_a_cidr`: CIDR block for public subnet A (default: `10.0.1.0/24`).
- `public_subnet_b_cidr`: CIDR block for public subnet B (default: `10.0.2.0/24`).
- `private_subnet_a_cidr`: CIDR block for private subnet A (default: `10.0.3.0/24`).
- `private_subnet_b_cidr`: CIDR block for private subnet B (default: `10.0.4.0/24`).
- `availability_zone_a`: The first availability zone (default: `us-east-1a`).
- `availability_zone_b`: The second availability zone (default: `us-east-1b`).

### Outputs

- `public_subnet_a_id`: The ID of the created public subnet A.
- `public_subnet_b_id`: The ID of the created public subnet B.
- `private_subnet_a_id`: The ID of the created private subnet A.
- `private_subnet_b_id`: The ID of the created private subnet B.

### Usage

To use this module, include it in your Terraform configuration, specifying the necessary variables for the VPC ID and subnet CIDR blocks.