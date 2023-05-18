resource "random_id" "this" {
  byte_length = 2
}

resource "aws_subnet" "public" {
  count             = length(var.public_subnets_cidr)
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnets_cidr[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-public-${var.environment}-${var.project}-${random_id.this.hex}"
    Environment = var.environment
    Project = var.project
  }
}

resource "aws_subnet" "private" {
  count             = length(var.private_subnets_cidr)
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnets_cidr[count.index]
  tags = {
    Name = "subnet-public-${var.environment}-${var.project}-${random_id.this.hex}"
    Environment = var.environment
    Project = var.project
  }
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = var.public_route_table_id
}

resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = var.private_route_table_id
}
