sync-submodules: ## Sync all the the git submodules
	git submodule init
	git submodule sync
	git submodule update

upgrade-submodules: ## Upgrade all the submodules to latest commit
	git submodule update --recursive --remote

