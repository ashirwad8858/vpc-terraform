data "aws_availability_zones" "available" {}

locals {
  vpc_cidr         = var.aws_vpc_cidr
  subnet_cidr_bits = ceil(log(var.subnet_count,2)) # Calculate the number of bits needed to create the subnets
  subnet_cidrs     = [for i in range(var.subnet_count) : cidrsubnet(local.vpc_cidr, local.subnet_cidr_bits, i)]


}


resource "aws_subnet" "aws_subnet" {
  count             = var.subnet_count
  vpc_id            = aws_vpc.aws_vpc.id
  cidr_block        = local.subnet_cidrs[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index % length(data.aws_availability_zones.available.names))
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.aws_vpc_name}-subnet-${count.index + 1}"
  }
}

output "subnet_ids" {
  value = [for subnet in aws_subnet.aws_subnet : subnet.id]
}