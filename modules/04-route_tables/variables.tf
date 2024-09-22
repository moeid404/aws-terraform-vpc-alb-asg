variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  type        = string
}

variable "nat_gateway_a_id" {
  description = "The ID of the primary NAT Gateway"
  type        = string
}

variable "nat_gateway_b_id" {
  description = "The ID of the secondary NAT Gateway"
  type        = string
}

variable "public_subnet_a_id" {
  description = "The ID of the public subnet A"
  type        = string
}

variable "public_subnet_b_id" {
  description = "The ID of the public subnet B"
  type        = string
}

variable "private_subnet_a_id" {
  description = "The ID of the private subnet A"
  type        = string
}

variable "private_subnet_b_id" {
  description = "The ID of the private subnet B"
  type        = string
}

