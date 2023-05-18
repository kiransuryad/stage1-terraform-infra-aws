resource "random_id" "this" {
  byte_length = 2
}

resource "aws_instance" "bastion" {
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_id

  vpc_security_group_ids = [aws_security_group.bastion.id]

  key_name = var.key_name

  tags = {
    Name = "ec2-bastion-${var.environment}-${var.project}-${random_id.this.hex}"
    Environment = var.environment
    Project = var.project
  }
}

resource "aws_security_group" "bastion" {
  name        = "bastion"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
