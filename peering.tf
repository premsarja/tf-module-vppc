resource "aws_vpc_peering_connection" "peer" {
  vpc_id = var.DEFAULT_VPC
  peer_vpc_id   = aws_vpc.main.id
  auto_accept = true
}