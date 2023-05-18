resource "random_id" "this" {
  byte_length = 2
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "vpc-${var.environment}-${var.project}-${random_id.this.hex}"
    Environment = var.environment
    Project = var.project
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw-${var.environment}-${var.project}-${random_id.this.hex}"
    Environment = var.environment
    Project = var.project
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "rtb-public-${var.environment}-${var.project}-${random_id.this.hex}"
    Environment = var.environment
    Project = var.project
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "rtb-private-${var.environment}-${var.project}-${random_id.this.hex}"
    Environment = var.environment
    Project = var.project
  }
}
