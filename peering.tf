resource "aws_vpc_peering_connection" "peer" {
  peer_owner_id = var.DEFAULT_VPC
  peer_vpc_id   = aws_vpc.bar.id
  vpc_id        = aws_vpc.foo.id
}