variable "public_sg_id" {
  description = "The ID of the public security group."
  type        = string
}

variable "public_subnet_a_id" {
  description = "The ID of Public Subnet A."
  type        = string
}

variable "public_subnet_b_id" {
  description = "The ID of Public Subnet B."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}
