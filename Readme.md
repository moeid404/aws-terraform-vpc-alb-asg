# AWS Infrastructure with Terraform

This repository contains Terraform modules for provisioning a highly available, scalable, and secure infrastructure on AWS. The setup includes a VPC, public and private subnets, NAT Gateways, Bastion Host, Auto Scaling Group (ASG), and an Application Load Balancer (ALB) to route traffic to web servers running in the private subnets.

## Project Structure

The project is divided into several Terraform modules that each handle different aspects of the infrastructure. Below is a brief description of each module:

### 1. **VPC Module**
   - Provisions a Virtual Private Cloud (VPC) with a configurable CIDR block.
   - Attaches an Internet Gateway to the VPC for outbound traffic.
   
   **Outputs:**
   - VPC ID
   - Internet Gateway ID

### 2. **Subnet Module**
   - Creates two public subnets and two private subnets in the specified VPC.
   - Public subnets allow instances to have internet access, while private subnets are isolated.

   **Outputs:**
   - Public and Private Subnet IDs

### 3. **NAT Gateway Module**
   - Sets up two NAT Gateways in the public subnets.
   - Provides outbound internet access for instances in the private subnets without exposing them to the internet.
   
   **Outputs:**
   - NAT Gateway IDs
   - Elastic IPs for NAT Gateways

### 4. **Route Table Module**
   - Creates route tables for public and private subnets.
   - Configures public subnets to route traffic through the Internet Gateway and private subnets through the NAT Gateways.
   
   **Outputs:**
   - Public and Private Route Table IDs

### 5. **Security Group Module**
   - Defines security groups for both public and private instances.
   - Allows SSH and HTTP access for public instances and allows SSH from public instances to private instances.

   **Outputs:**
   - Security Group IDs for Public and Private Subnets

### 6. **Bastion Host Module**
   - Provisions a bastion host in the public subnets.
   - Generates an RSA key pair for secure SSH access.
   
   **Outputs:**
   - Bastion Host EC2 instance IDs
   - Bastion private key (Sensitive)

### 7. **Load Balancer (ALB) Module**
   - Creates an Application Load Balancer in front of the Auto Scaling Group.
   - Configures target groups and listeners for routing HTTP traffic to instances.
   
   **Outputs:**
   - ALB DNS Name
   - Target Group ARN

### 8. **Auto Scaling Group (ASG) Module**
   - Provisions an Auto Scaling Group to ensure high availability of web servers.
   - Automatically adjusts the number of EC2 instances based on traffic and demand.
   - Instances are launched in the private subnets and associated with the ALB.

   **Outputs:**
   - Auto Scaling Group ID
   - Launch Configuration ID

## Architecture Overview

- **VPC**: A secure network boundary is created using AWS VPC with both public and private subnets across two availability zones.
- **NAT Gateway**: Allows instances in private subnets to initiate outbound connections to the internet without exposing them to incoming traffic.
- **Bastion Host**: Provides secure SSH access to instances within private subnets.
- **Auto Scaling Group**: Ensures high availability by dynamically scaling the number of EC2 instances based on demand.
- **Application Load Balancer**: Distributes incoming HTTP traffic to instances running in the private subnets.

## Prerequisites

- AWS account with sufficient permissions to create resources.
- Terraform installed on your local machine.

## Usage

1. Clone this repository:

   ```bash
   git clone https://github.com/your-repo-name.git
   cd your-repo-name

2. Initialize the Terraform modules:

   ```bash
   terraform init

3. Review the configuration and apply the changes:

   ```bash
   terraform plan
   terraform apply

4. Once provisioning is complete, Terraform will output important information like the Bastion Host private key path, ALB DNS name, and other relevant resources.

## Author Information

This project is maintained by:

- **Mohamed Eid** - [GitHub Profile](https://github.com/moeid404)  
  Email: moeid404@gmail.com

Feel free to reach out to us for any questions, issues, or contributions.