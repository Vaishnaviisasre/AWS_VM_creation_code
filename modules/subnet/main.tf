resource "aws_subnet" "my-subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name = var.name
  }
  map_public_ip_on_launch = var.map_public_ip_on_launch
}
