resource "aws_iam_instance_profile" "bosh_lite_profile" {
  name  = "${var.env}_bosh_lite_profile"
  role = "${aws_iam_role.bosh_lite_role.name}"
}

resource "aws_iam_role" "bosh_lite_role" {
  name = "${var.env}_bosh_lite_role"
  path = "/custom/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}
