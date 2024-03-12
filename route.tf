resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }


  tags = {
    Name = "roboshop-${var.ENV}-public-rt"
  }
}

#add subnet association to route table

resource "aws_route_table_association" "public_subnet_rt" {
  count = length(aws_subnet.public_subnet.*.id)
  subnet_id      = element(aws_subnet.public_subnet.*.id,count.index)
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  # route {
  #   cidr_block = "0.0.0.0/0"
  #   gateway_id = aws_internet_gateway.igw.id
  # }


  tags = {
    Name = "roboshop-${var.ENV}-prvt-rt"
  }
}

#add subnet association to route table

resource "aws_route_table_association" "private_subnet_rt" {
  count = length(aws_subnet.PRIVATE_SUBNET_CIDR.*.id)
  subnet_id      = element(aws_subnet.PRIVATE_SUBNET_CIDR.*.id,count.index)
  route_table_id = aws_route_table.private_rt.id
}