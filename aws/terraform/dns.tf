data "aws_route53_zone" "dns_zone" {
  name         = "${var.dns_zone_name}."
}

resource "aws_route53_record" "wildcard_public_record" {
  zone_id = "${data.aws_route53_zone.dns_zone.zone_id}"
  name    = "*.${var.public_system_domain}"
  type    = "A"
  ttl     = "60"
  records = ["${aws_eip.bosh_lite.public_ip}"]
}
