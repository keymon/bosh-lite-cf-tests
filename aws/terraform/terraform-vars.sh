export TF_VAR_env="${DEPLOY_ENV}"

export TF_VAR_aws_account_id="$(pass keytwine/aws/sandbox/account_id)"

current_ip="$(cat ../generated/current_ip.txt)"
export TF_VAR_admin_cidrs="$(
	pass keytwine/aws/allowed_ips.json |
		jq -r --arg current_ip "$current_ip" ' . += [$current_ip] | unique'
)"

export TF_VAR_vcap_ssh_id_rsa="$(cat ../generated/vcap.bosh_lite.id_rsa)"
export TF_VAR_vcap_ssh_id_rsa_pub="$(cat ../generated/vcap.bosh_lite.id_rsa.pub)"
