resource "aws_security_group" "admin-access-ssh" {
  vpc_id      = "${aws_vpc.bosh-lite.id}"
  name        = "${var.env}-admin-access-ssh"
  description = "Allow access from allowed admin variables"

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
    cidr_blocks = ["${formatlist("%s/32", var.admin_cidrs)}"]
  }

  tags {
    Name = "${var.env}-office-access-ssh"
  }
}
