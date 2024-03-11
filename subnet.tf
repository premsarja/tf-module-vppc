resource "aws_subnet" "PUBLIC_SUBNET_CIDR" {
  count = length(var.PUBLIC_SUBNET_CIDR.id)  
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.PUBLIC_SUBNET_CIDR,count.index)

  tags = {
    Name = "roboshop-${var.ENV}-public-subnet"
  }
}