resource "random_id" "this" {
  byte_length = 2
}

resource "aws_security_group" "bastion" {
  name        = "bastion-sg-${var.environment}-${var.project}-${random_id.this.hex}"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-sg-${var.environment}-${var.project}-${random_id.this.hex}"
    Environment = var.environment
    Project = var.project
  }
}

resource "aws_security_group" "rds" {
  name        = "rds-sg-${var.environment}-${var.project}-${random_id.this.hex}"
  description = "Allow inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [aws_security_group.bastion.id] # Allow traffic only from bastion host
  }

  tags = {
    Name = "rds-sg-${var.environment}-${var.project}-${random_id.this.hex}"
    Environment = var.environment
    Project = var.project
  }
}
