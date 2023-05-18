variable "environment" {
  description = "The environment (dev, prod, etc.)"
}

variable "project" {
  description = "The project name"
}

variable "acl" {
  description = "The canned ACL to apply"
  default     = "private"
}

variable "allowed_ips" {
  description = "List of allowed IPs"
  type        = list(string)
  default     = []
}
