output "environment" {
  value = "${var.env}"
}

output "region" {
  value = "${var.region}"
}

output "vpc_cidr" {
  value = "${aws_vpc.bosh-lite.cidr_block}"
}

output "vpc_id" {
  value = "${aws_vpc.bosh-lite.id}"
}

output "subnet0_cidr" {
  value = "${aws_subnet.infra.0.cidr_block}"
}

output "subnet0_id" {
  value = "${aws_subnet.infra.0.id}"
}

output "zone0" {
  value = "${var.zones["zone0"]}"
}

output "zone1" {
  value = "${var.zones["zone1"]}"
}

output "zone2" {
  value = "${var.zones["zone2"]}"
}

output "infra_subnet_ids" {
  value = "${join(",", aws_subnet.infra.*.id)}"
}

output "bosh_security_groups" {
  value = [
    "${aws_security_group.admin-access-ssh.name}",
    "${aws_security_group.admin-access-bosh.name}",
    "${aws_security_group.allow-web-access.name}",
  ]
}

output "vcap_ssh_key_pair_name" {
  value = "${aws_key_pair.vcap_bosh_lite_ssh.key_name}"
}

output "bosh_lite_instance_profile" {
  value = "${aws_iam_instance_profile.bosh_lite_profile.id}"
}

output "bosh_lite_external_ip" {
  value = "${aws_eip.bosh_lite.public_ip}"
}
