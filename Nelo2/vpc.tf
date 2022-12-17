resource "aws_vpc" "vpc-demo" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = "test"
    }
}

output "vpc_id-output" {
        description = "the id of the vpc"
        value = aws_vpc.vpc-demo.id
 }