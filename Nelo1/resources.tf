# create vpc igw, subnets, routetables, Nat, ec2, 

provider "aws" {
    region = "us-east-1"
    profile = "default"

}

resource "aws_vpc" "vpc-demo" {
    cidr_block = "20.0.0.0/16"
    tags = {
        Name = "test"
    }
}

output "vpc_id-output" {
        description = "the id of the vpc"
        value = aws_vpc.vpc-demo.id
 }

resource "aws_internet_gateway" "IGW-demo" {
  vpc_id = aws_vpc.vpc-demo.id
  tags = {
    Name = "igw-test"
  }
}

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

resource "aws_route_table" "pub-rt" {
    vpc_id = aws_vpc.vpc-demo.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.IGW-demo.id
    }
  
}

resource "aws_route_table_association" "a" {
    subnet_id = aws_subnet.pub-sunet1.id
    route_table_id = aws_route_table.pub-rt.id
    
}


resource "aws_route_table_association" "b" {
    subnet_id = aws_subnet.pub-subnet2.id
    route_table_id = aws_route_table.pub-rt.id
  
}