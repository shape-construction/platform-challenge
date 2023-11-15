resource "aws_route53_zone" "the_future_of_construction" {
  name = "thefutureof.construction"
}

resource "aws_route53_record" "the_future_of_construction" {
  zone_id = aws_route53_zone.the_future_of_construction.id
  type    = "A"
  name    = ""
  records = ["127.0.0.1"]
  ttl     = 3600
}

resource "aws_route53_record" "www_the_future_of_construction" {
  zone_id = aws_route53_zone.the_future_of_construction.id
  type    = "A"
  name    = "www"
  records = ["127.0.0.1"]
  ttl     = 3600
}

resource "aws_route53_record" "app_the_future_of_construction" {
  zone_id = aws_route53_zone.the_future_of_construction.id
  type    = "A"
  name    = "app"

  alias {
    zone_id                = "Z2FDTNDATAQYW2"
    name                   = "d2fel58fjximxf.cloudfront.net"
    evaluate_target_health = false
  }
}

output "the_future_of_construction_nameservers" {
  value = aws_route53_zone.the_future_of_construction.name_servers
}
