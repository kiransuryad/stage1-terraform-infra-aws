resource "aws_ec2_transit_gateway_vpc_attachment" "attachment" {
  vpc_id             = var.vpc_id
  transit_gateway_id = var.transit_gateway_id

  subnet_ids = var.subnet_ids

  tags = {
    Name        = "${var.project}-${var.environment}-tgw-attachment"
    Environment = var.environment
    Project     = var.project
  }
}
