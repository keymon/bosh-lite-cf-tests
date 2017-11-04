Bosh-lite on VirtualBox
-----------------------

Project for running bosh-lite.

Everything is run using makefile.

Basic usage:

````
make deploy-bosh
```

You can check all the targets with:

```
$ make
bosh-configure-alias           Create vbox environment
bosh-configure                 Configure aliases, network etc.
bosh-configure-route           Configure a route to the bosh-lite vms using boshlite
bosh-create-env                Start a bosh-lite environment on virtualbox
cck-cf                         Do a cloud check. Use after bosh-lite is restarted.
cck-prometheus                 Do a cloud check. Use after bosh-lite is restarted.
deploy-cf                      Deploy the CF on bosh-lite
deploy-prometheus              Deploy the CF on bosh-lite
interpolate-bosh-manifest      interpolate the bosh manifest
interpolate-cf-manifest        Interpolate the CF manifest
interpolate-cloud-config       Interpolate the cloudconfig from CF
interpolate-prometheus-manifest Interpolate the prometheus manifest
load_bosh_creds                Helper to load the bosh credentials into variables
ssh-bosh                       SSH into the BOSH vm
upload-stemcell                Upload latest stemcell to bosh
```

To deploy everything:

```
make depoy-bosh deploy-cf deploy-prometheus
```
