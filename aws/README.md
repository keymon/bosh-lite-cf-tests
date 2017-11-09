Bosh-lite on VirtualBox
-----------------------

Project for running bosh-lite on AWS. It also deploys cf, prometheus...

Basic usage
-----------

Everything is run using makefile.

````
make deploy-bosh
```

You can check all the targets with:

```
$ make
bosh-configure-alias           Create vbox environment
bosh-configure                 Configure aliases, network etc.
bosh-create-env                Start a bosh-lite environment on aws
bosh-delete-env                Stop and delete a bosh-lite environment on aws
bosh-deploy                    Deploy bosh
bosh-interpolate-manifest      interpolate the bosh manifest
bosh-recreate-env              Restart a bosh-lite environment on aws
bosh-resurrect                 Recreate terraform stuff, bosh and do cck
bosh-sleep                     Stop the bosh lite instance to save some money
bosh-ssh                       SSH into the BOSH vm
bosh-terminate                 Terminate the bosh lite instance and eip to save some money
bosh-tunnel                    Create a SSH tunnel and proxy into the BOSH vm
bosh-upload-stemcell           Upload latest stemcell to bosh
bosh-wakeup                    Start the bosh lite instance and restart the gardens/vms from the deployments
cf-deploy                      Deploy the CF on bosh-lite
cf-interpolate-manifest        Interpolate the CF manifest
interpolate-cloud-config       Interpolate the cloudconfig from CF
load_bosh_creds                Helper to load the bosh credentials into variables
prometheus-deploy              Deploy the CF on bosh-lite
prometheus-interpolate-manifest Interpolate the prometheus manifest
terraform_apply                Apply terraform
terraform_destroy              Destroy terraform
```

The main targets are:

```
$ make
terraform_apply                Apply terraform
bosh-deploy                    Deploy bosh
cf-deploy                      Deploy the CF on bosh-lite
prometheus-deploy              Deploy the CF on bosh-lite
```

So, to deploy everything:

```
make terraform_apply bosh-deploy bosh-upload-stemcell deploy-cf deploy-prometheus
```

AWS credentials
---------------

You shall export the AWS credentials as environment variables:

```
AWS_ACCESS_KEY_ID=...
AWS_SECRET_ACCESS_KEY=...
AWS_SESSION_TOKEN=...
```

I encourage use STS for this. See my project https://github.com/keymon/aws_key_management to manage STS creds easily.

I use a forked version of the bosh-cpi that supports STS


Saving money: stop your VM
--------------------------

If you do not want to waste money with a VM running all time in AWS:

```
bosh-sleep                     Stop the bosh lite instance to save some money
bosh-wakeup                    Start the bosh lite instance and restart the gardens/vms from the deployments

bosh-terminate                 Terminate the bosh lite instance and eip to save some money
bosh-resurrect                 Recreate terraform stuff, bosh and do cck
```

Connecting to CF using proxy
----------------------------

You can create a SOCKS proxy with ssh by running

```
make bosh-tunnel
```

It recommend use [foxyproxy](https://chrome.google.com/webstore/search/foxyproxy?hl=en) or similar an create a rule
to use the SOCKS proxy to access `*.bosh-lite.com`


