resource "aws_internet_gateway" "IGW-demo" {
  vpc_id = aws_vpc.vpc-demo.id
  tags = {
    Name = "igw-test"
  }
}