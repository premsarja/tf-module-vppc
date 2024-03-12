resource "aws_vpc_peering_connection" "peer" {
  vpc_id = var.DEFAULT_VPC_ID
  peer_vpc_id   = aws_vpc.main.id  #this is valid if both the VPC's are in the same account
  auto_accept = true
}