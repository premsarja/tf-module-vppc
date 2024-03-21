# associated the VPC TO THE PRIVATE HOSTED ZONE
resource "aws_route53_zone_association" "secondary" {
  zone_id = var.PRIVATE_HOSTED_ZONE_ID
  vpc_id  = aws_vpc.secondary.id
}