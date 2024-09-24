## NAT Gateway Module

This module provisions Elastic IPs and NAT Gateways in AWS, enabling private subnets to access the internet securely while preventing inbound traffic from the internet.

### Features

- **Elastic IPs**: Two Elastic IPs are created, which will be associated with the NAT Gateways to allow outbound internet access.
- **NAT Gateways**: Two NAT Gateways are set up in the specified public subnets, providing a means for instances in private subnets to connect to the internet without exposing them directly.

### Inputs

- `public_subnet_a_id`: The ID of public subnet A where NAT Gateway A will be deployed. This value is obtained from the outputs of the **02-subnets** module.
- `public_subnet_b_id`: The ID of public subnet B where NAT Gateway B will be deployed. This value is obtained from the outputs of the **02-subnets** module.

### Outputs

- `nat_eip_a_id`: The ID of the Elastic IP for NAT Gateway A.
- `nat_eip_b_id`: The ID of the Elastic IP for NAT Gateway B.
- `nat_gateway_a_id`: The ID of NAT Gateway A.
- `nat_gateway_b_id`: The ID of NAT Gateway B.

### Usage

To use this module, include it in your Terraform configuration and specify the necessary subnet IDs.