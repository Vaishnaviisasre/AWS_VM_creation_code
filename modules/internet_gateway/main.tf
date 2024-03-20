resource "aws_internet_gateway" "my-igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.name
  }
}
