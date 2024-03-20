
resource "aws_route_table" "my-route-table" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.name
  }
}


# Associate public subnet with the route table
resource "aws_route_table_association" "my-vpc-public_association" {
  #subnet_id      = aws_subnet.my-vpc-public_subnet.id
  subnet_id      = var.subnet_id 
  route_table_id = aws_route_table.my-route-table.id
}

# Add a route to the internet gateway in the route table
resource "aws_route" "internet_gateway_route" {
  route_table_id         = aws_route_table.my-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  #gateway_id             = aws_internet_gateway.my-vpc-igw.id
  gateway_id              = var.gateway_id
}