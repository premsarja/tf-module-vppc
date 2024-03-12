resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "roboshop-${var.ENV}-igw"
  }
}

#crest ELASTIC IP address which would used by the NAT ,Ensure EIP is provisioned first and then NAT

resource "aws_eip" "ngw_ip" {
   vpc = true  
    
    tags ={ 
    Name =  "roboshop-${var.ENV}-ngw-ip"
  }
}

#CREATS NAT GATEWAY and will attached to PUBLIC SUBNET

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw_ip
  subnet_id = aws_subnet.public_subnet.*.id[0]

  tags = {
    Name = "gw-NAT"
  }
}