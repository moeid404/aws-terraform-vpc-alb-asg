## VPC Module

The VPC module provisions a Virtual Private Cloud (VPC) in AWS, allowing you to create a secure and isolated network environment for your resources. 

### Features

- **VPC Creation**: This module creates a VPC with a configurable CIDR block, which defines the IP address range for the network.
- **Internet Gateway**: An Internet Gateway is attached to the VPC, enabling communication between resources in the VPC and the internet.

### Inputs

- `vpc_cidr`: Specifies the CIDR block for the VPC (default is `10.0.0.0/16`).

### Outputs

- `vpc_id`: The ID of the created VPC.
- `vpc_cidr`: The CIDR block of the VPC.
- `internet_gateway_id`: The ID of the attached Internet Gateway.

### Usage

This module can be used as part of a larger Terraform configuration to set up a foundational networking layer in your AWS infrastructure.
