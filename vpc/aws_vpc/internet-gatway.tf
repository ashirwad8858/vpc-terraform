resource "aws_internet_gateway" "aws_internet_gateway" {
  vpc_id = aws_vpc.aws_vpc.id

  tags = {
    Name = "${var.aws_vpc_name}-ig"
  }
}
# 
# resource "aws_internet_gateway_attachment" "aws_ig" {
#   internet_gateway_id = aws_internet_gateway.aws_internet_gateway.id
#   vpc_id              = aws_vpc.aws_vpc.id
# }