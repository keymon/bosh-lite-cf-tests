# Current directory . via https://stackoverflow.com/a/18137056/395686
MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_DIR := $(patsubst %/,%,$(dir $(MKFILE_PATH)))
PROJECT_DIR := ${CURRENT_DIR}/..

UNAME_S := $(shell uname -s)

help:
	@grep -hE '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

include Makefile.bosh
include Makefile.cf
include Makefile.prometheus
