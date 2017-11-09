#!/bin/sh

eval $(sh generated/terraform_outputs_vars.sh)

cat <<EOF
export BOSH_CLIENT=admin
export BOSH_CLIENT_SECRET=$(bosh int ./generated/bosh-creds.yml --path /admin_password)
export BOSH_CA_CERT=generated/bosh_ca.crt
export BOSH_GW_HOST=${BOSH_LITE_EXTERNAL_IP}
export BOSH_GW_USER=jumpbox
export BOSH_GW_PRIVATE_KEY=generated/jumpbox-bosh-lite.id_rsa
EOF
