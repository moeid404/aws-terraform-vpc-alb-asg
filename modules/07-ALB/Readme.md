# Load Balancer (ALB) Terraform Module

## Purpose
This Terraform module provisions an Application Load Balancer (ALB) along with a target group and listener in an AWS environment. It enables efficient routing of HTTP traffic to specified targets.

## Features
- **ALB Provisioning**: Automatically creates an Application Load Balancer for distributing incoming application traffic.
- **Target Group Creation**: Sets up a target group for the ALB to manage and health-check its targets.
- **Listener Configuration**: Configures a listener for the ALB to forward traffic to the target group.

## Inputs
- `public_sg_id` (string): The ID of the public security group. This value is obtained from the outputs of the **05-security_groups** module.
- `public_subnet_a_id` (string): The ID of Public Subnet A. This value is obtained from the outputs of the **02-subnets** module.
- `public_subnet_b_id` (string): The ID of Public Subnet B. This value is obtained from the outputs of the **02-subnets** module.
- `vpc_id` (string): The ID of the VPC. This value is obtained from the outputs of the **01-vpc-igw** module.

## Outputs
- `alb_arn`: The ARN of the Application Load Balancer.
- `alb_dns_name`: The DNS name of the Application Load Balancer.
- `target_group_arn`: The ARN of the target group.
- `alb_listener_arn`: The ARN of the ALB listener.

## Usage
To use this module, include it in your Terraform configuration and provide the necessary input variables, such as the public security group ID and the subnet IDs, which are outputs from the referenced VPC and security groups modules.
