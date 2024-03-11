resource "aws_vpc" "PUBLIC_SUBNET" {
  count     = length(var.PUBLIC_SUBNET)
  cidr_block                = var.VPC_CIDR
  enable_dns_hostnames      = true
  tags = {
    Name = "roboshop-${var.ENV}-vpc"
  }
} 


