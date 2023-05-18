variable "ami" {
  description = "AMI ID for the bastion host"
}

variable "public_subnet_id" {
  description = "Public subnet ID"
}

variable "key_name" {
  description = "Key name for SSH access"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}


