resource "aws_subnet" "Pv-subnet1" {
    vpc_id = aws_vpc.vpc-demo.id
    cidr_block = "20.0.2.0/28"
    availability_zone = "us-east-1a"
    tags = {
      "Name" = "demo-vpc-privte-subnet1"
    }
  
}

resource "aws_subnet" "pv-subnet2" {
    vpc_id = aws_vpc.vpc-demo.id
    cidr_block = "20.0.3.0/28"
    availability_zone = "us-east-1b"
    tags = {
      "Name" = "demo-vpc-private-subnet2"
    }
  
}

output "subnet1_id-output" {
  description = "subnet id of the pub-subnet1"
  value = aws_subnet.pub-sunet1.id
  
}

output "subnet2_id-output" {
  description = "subnet id of the pub-subnet2"
  value = aws_subnet.pv-subnet2.id
  }

