resource "aws_security_group" "admin-access-ssh" {
  vpc_id      = "${aws_vpc.bosh-lite.id}"
  name        = "${var.env}-admin-access-ssh"
  description = "Allow access from allowed admin IPs to ssh"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${formatlist("%s/32", concat(var.admin_cidrs, list(aws_eip.bosh_lite.public_ip)))}"]
  }

  tags {
    Name = "${var.env}-office-access-ssh"
  }
}

resource "aws_security_group" "admin-access-bosh" {
  vpc_id      = "${aws_vpc.bosh-lite.id}"
  name        = "${var.env}-admin-access-bosh"
  description = "Allow access from allowed admin IPs to bosh"

  ingress {
    from_port   = 6868
    to_port     = 6868
    protocol    = "tcp"
    cidr_blocks = ["${formatlist("%s/32", concat(var.admin_cidrs, list(aws_eip.bosh_lite.public_ip)))}"]
  }

  ingress {
    from_port   = 25555
    to_port     = 25555
    protocol    = "tcp"
    cidr_blocks = ["${formatlist("%s/32", concat(var.admin_cidrs, list(aws_eip.bosh_lite.public_ip)))}"]
  }

  tags {
    Name = "${var.env}-office-access-bosh"
  }
}


