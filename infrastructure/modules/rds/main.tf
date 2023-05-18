resource "random_id" "this" {
  byte_length = 2
}

resource "aws_db_subnet_group" "default" {
  name       = "rds-subnet-group-${var.environment}-${var.project}-${random_id.this.hex}"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "rds-subnet-group-${var.environment}-${var.project}-${random_id.this.hex}"
    Environment = var.environment
    Project = var.project
  }
}

resource "aws_db_instance" "default" {
  identifier        = "rds${replace(var.environment, "/[^a-zA-Z0-9]/", "")}${replace(var.project, "/[^a-zA-Z0-9]/", "")}-${random_id.this.hex}"
  allocated_storage = var.allocated_storage
  storage_type      = "gp2"
  engine            = "postgres"
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  db_name              = var.db_name
  username          = var.db_username
  password          = var.db_password
  parameter_group_name = "default.postgres13"
  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = var.vpc_security_group_ids
  publicly_accessible = false
  skip_final_snapshot = true

  tags = {
    Name = "rds-instance-${var.environment}-${var.project}-${random_id.this.hex}"
    Environment = var.environment
    Project = var.project
  }
}
