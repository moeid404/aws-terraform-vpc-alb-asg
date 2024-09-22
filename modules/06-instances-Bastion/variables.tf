variable "ami" {
  type    = string
  default = "ami-0e86e20dae9224db8" # for ubuntu instance >> ubuntu@ipv4
}

variable "instance_type" {
  description = "The type of EC2 instance to launch."
  type        = string
  default     = "t2.micro"
}

variable "public_subnet_a_id" {
  description = "The ID of Public Subnet A"
  type        = string
}

variable "public_subnet_b_id" {
  description = "The ID of Public Subnet B"
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

variable "public_sg_id" {
  description = "The ID of the public security group"
  type        = string
}

variable "private_sg_id" {
  description = "The ID of the private security group"
  type        = string
}
