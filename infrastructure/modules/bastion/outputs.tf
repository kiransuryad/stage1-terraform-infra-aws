output "bastion_host_id" {
  description = "ID of the bastion host"
  value       = aws_instance.bastion.id
}
