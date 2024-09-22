# Auto Scaling Group (ASG) Terraform Module

## Purpose
This Terraform module provisions an Auto Scaling Group (ASG) along with a launch configuration in an AWS environment. It automates the management of EC2 instances to ensure application availability and scalability.

## Features
- **Launch Configuration**: Creates a launch configuration for the ASG, defining the instance type, AMI, key pair, and security groups.
- **Auto Scaling Group Creation**: Configures an ASG that dynamically adjusts the number of instances based on demand.
- **User Data Script**: Initializes the EC2 instances with a simple HTTP server running Python.

## Inputs
- `ami` (string): The Amazon Machine Image (AMI) ID to use for the EC2 instances. Default is `"ami-0e86e20dae9224db8"` (for Ubuntu).
- `instance_type` (string): The type of EC2 instance to launch. Default is `"t2.micro"`.
- `key_pair_name` (string): The name of the key pair to use for the instances. This value is obtained from the outputs of the **06-instances-Bastion** module.
- `public_sg_id` (string): The ID of the public security group. This value is obtained from the outputs of the **05-security_groups** module.
- `private_subnet_a_id` (string): The ID of Private Subnet A. This value is obtained from the outputs of the **02-subnets** module.
- `private_subnet_b_id` (string): The ID of Private Subnet B. This value is obtained from the outputs of the **02-subnets** module.
- `target_group_arn` (string): The ARN of the ALB target group. This value is obtained from the outputs of the **07-ALB** module.

## Outputs
- `launch_configuration_id`: The ID of the launch configuration.
- `autoscaling_group_id`: The ID of the Auto Scaling Group.
- `autoscaling_group_arn`: The ARN of the Auto Scaling Group.
- `autoscaling_group_name`: The name of the Auto Scaling Group.

## Usage
To use this module, include it in your Terraform configuration and provide the necessary input variables, such as the AMI ID, instance type, key pair name, and target group ARN, which are outputs from the referenced VPC and ALB modules.
