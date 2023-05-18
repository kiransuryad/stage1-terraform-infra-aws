variable "vpc_id" {
  description = "VPC ID to attach to the Transit Gateway"
  type        = string
}

variable "transit_gateway_id" {
  description = "Transit Gateway ID to be attached"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs to be attached to the Transit Gateway"
  type        = list(string)
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}
