resource "aws_subnet" "pub-sunet1" {
    vpc_id = aws_vpc.vpc-demo.id
    cidr_block = "20.0.0.0/28"
    availability_zone = "us-east-1a"
    tags = {
      Name = "demo-public-subnet1"
    }

  
}

resource "aws_subnet" "pub-subnet2" {
    vpc_id = aws_vpc.vpc-demo.id
    cidr_block = "20.0.1.0/28"
    availability_zone = "us-east-1b"
    tags = {
      "Name" = "demo-public-subnet2"
    }
  
}