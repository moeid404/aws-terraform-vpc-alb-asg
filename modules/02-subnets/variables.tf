variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnet_a_cidr" {
  description = "CIDR block for public subnet A."
  default     = "10.0.1.0/24"
}

variable "public_subnet_b_cidr" {
  description = "CIDR block for public subnet B."
  default     = "10.0.2.0/24"
}

variable "private_subnet_a_cidr" {
  description = "CIDR block for private subnet A."
  default     = "10.0.3.0/24"
}

variable "private_subnet_b_cidr" {
  description = "CIDR block for private subnet B."
  default     = "10.0.4.0/24"
}

variable "availability_zone_a" {
  description = "The first availability zone."
  default     = "us-east-1a"
}

variable "availability_zone_b" {
  description = "The second availability zone."
  default     = "us-east-1b"
}

