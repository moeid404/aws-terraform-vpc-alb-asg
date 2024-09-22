variable "ami" {
  type    = string
  default = "ami-0e86e20dae9224db8"  # IT's ubuntu >> ssh ubuntu@IPv4
}

variable "instance_type" {
  description = "The type of EC2 instance to launch."
  type        = string
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "The name of the key pair to use for the instances"
  type        = string
}

variable "public_sg_id" {
  description = "The ID of the public security group"
  type        = string
}

variable "private_subnet_a_id" {
  description = "The ID of Private Subnet A"
  type        = string
}

variable "private_subnet_b_id" {
  description = "The ID of Private Subnet B"
  type        = string
}

variable "target_group_arn" {
  description = "The ARN of the ALB target group"
  type        = string
}

