variable "public_subnets_cidr" {
  description = "List of CIDR blocks for public subnets"
  type = list(string)
}

variable "private_subnets_cidr" {
  description = "List of CIDR blocks for private subnets"
  type = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "public_route_table_id" {
  description = "Public route table ID"
}

variable "private_route_table_id" {
  description = "Private route table ID"
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}


