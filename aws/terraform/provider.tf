provider "aws" {
  region              = "${var.region}"
  version             = "~> 1.2"
  allowed_account_ids = [
    "${var.aws_account_id}",
  ]
}
