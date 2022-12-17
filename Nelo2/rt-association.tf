
resource "aws_route_table_association" "a" {
    subnet_id = aws_subnet.pub-sunet1.id
    route_table_id = aws_route_table.pub-rt.id
    
}


resource "aws_route_table_association" "b" {
    subnet_id = aws_subnet.pub-subnet2.id
    route_table_id = aws_route_table.pub-rt.id
  
}