module "vpc" {
  source = "../modules/vpc"

  cidr_block = var.vpc_cidr_block
}

module "subnets" {
  source = "../modules/subnets"

  vpc_id           = module.vpc.vpc_id
  subnet_cidr_list = var.subnet_cidr_blocks
}

module "postgres" {
  source = "../modules/postgres"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.subnets.subnet_ids

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}

output "postgres_endpoint" {
  value = module.postgres.endpoint
}