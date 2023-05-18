output "bastion_sg_id" {
  description = "Security Group ID for the Bastion host"
  value       = aws_security_group.bastion.id
}

output "rds_sg_id" {
  description = "Security Group ID for the RDS instance"
  value       = aws_security_group.rds.id
}
