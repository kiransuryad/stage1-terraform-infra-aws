variable "environment" {
  description = "Environment name"
  type        = string
  default     = "prod"
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "public_subnets_cidr" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnets_cidr" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "ami" {
  description = "AMI ID for the bastion host"
  type        = string
}

variable "key_name" {
  description = "Key name for SSH access"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "rds_allocated_storage" {
  description = "Allocated storage size for the RDS instance"
  type        = number
}

variable "rds_engine_version" {
  description = "Postgres engine version"
  type        = string
}

variable "rds_instance_class" {
  description = "Instance class for the RDS instance"
  type        = string
}

variable "rds_db_name" {
  description = "Database name"
  type        = string
}

variable "rds_db_username" {
  description = "Database username"
  type        = string
}

variable "rds_db_password" {
  description = "Database password"
  type        = string
}

/* variable "transit_gateway_id" {
  description = "transit gateway id"
  type        = string
} */


