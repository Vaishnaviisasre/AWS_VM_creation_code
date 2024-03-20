resource "aws_instance" "my-instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  # Attach the security group to the EC2 instance
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = var.name
  }
}
