resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.aws_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws_internet_gateway.id
  }

  tags = {
    Name = "${var.aws_vpc_name}-main-route-table"
  }
}

resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.aws_subnet[0].id
  route_table_id = aws_route_table.route-table.id
}
