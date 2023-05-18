module "vpc" {
  source      = "../../modules/vpc"
  vpc_cidr    = var.vpc_cidr
  vpc_name    = var.vpc_name
  environment = var.environment
  project     = var.project
}

module "subnets" {
  source                  = "../../modules/subnets"
  vpc_id                  = module.vpc.vpc_id
  public_subnets_cidr     = var.public_subnets_cidr
  private_subnets_cidr    = var.private_subnets_cidr
  public_route_table_id   = module.vpc.public_route_table_id
  private_route_table_id  = module.vpc.private_route_table_id
  environment             = var.environment
  project     = var.project
}

module "bastion" {
  source           = "../../modules/bastion"
  ami              = var.ami
  public_subnet_id = module.subnets.public_subnet_ids[0]
  key_name         = var.key_name
  vpc_id           = module.vpc.vpc_id
  environment      = var.environment
  project     = var.project
}

module "rds" {
  source         = "../../modules/rds"
  allocated_storage = var.rds_allocated_storage
  engine_version    = var.rds_engine_version
  instance_class    = var.rds_instance_class
  db_name           = var.rds_db_name
  db_username       = var.rds_db_username
  db_password       = var.rds_db_password
  subnet_ids        = module.subnets.private_subnet_ids
  environment       = var.environment
  project           = var.project
  vpc_security_group_ids = [module.security_groups.rds_sg_id]
}

module "security_groups" {
  source      = "../../modules/security_groups"
  vpc_id      = module.vpc.vpc_id
  environment = var.environment
  project     = var.project
}

/* module "transit_gateway_attachment" {
  source             = "../../modules/transit_gateway_attachment"
  vpc_id             = module.vpc.vpc_id
  transit_gateway_id = var.transit_gateway_id
  subnet_ids         = module.subnets.public_subnet_ids
  environment        = var.environment
  project            = var.project
} */

 module "s3_bucket" {
  source       = "../../modules/s3_bucket"
  environment  = var.environment
  project      = var.project
  acl          = "private"
  # allowed_ips  = ["203.0.113.0/24", "198.51.100.0/24"]
} 