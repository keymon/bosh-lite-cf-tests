resource "aws_key_pair" "vcap_bosh_lite_ssh" {
  key_name   = "${var.env}"
  public_key = "${var.vcap_ssh_id_rsa_pub}"
}

resource "aws_s3_bucket_object" "bosh_lite_id_rsa_s3" {
  key                    = "${var.env}/vcap-bosh_lite.id_rsa"
  bucket                 = "${var.terraform_state_bucket_name}" # from terraform-common.sh and backend_config.tf
  content                = "${var.vcap_ssh_id_rsa}"
}

resource "aws_s3_bucket_object" "bosh_lite_id_rsa_pub_s3" {
  key                    = "${var.env}/vcap-bosh_lite.id_rsa"
  bucket                 = "${var.terraform_state_bucket_name}" # from terraform-common.sh and backend_config.tf
  content                = "${var.vcap_ssh_id_rsa_pub}"
}
