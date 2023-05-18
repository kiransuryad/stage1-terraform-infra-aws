output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  value = module.subnets.subnet_ids
}

output "postgres_endpoint" {
  value = module.postgres.endpoint
}