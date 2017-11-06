export TF_VAR_env="${DEPLOY_ENV}"

export TF_VAR_aws_account_id="$(pass keytwine/aws/sandbox/account_id)"

current_ip="$(curl -qs ifconfig.co)"

export TF_VAR_admin_cidrs="$(
	pass keytwine/aws/allowed_ips.json |
		jq -r --arg current_ip "$current_ip" ' . += [$current_ip] | unique'
)"
