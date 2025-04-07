.PHONY: git-config-from-file

GIT_CONFIG_FILE=./git/global_setting

git-config-from-file:
	@echo "Applying git config from $(GIT_CONFIG_FILE)..."
	@while IFS== read -r key value; do \
		if [ -n "$$key" ] && [ -n "$$value" ]; then \
			echo "Setting: $$key = $$value"; \
			git config --global "$$key" "$$value"; \
		fi; \
	done < $(GIT_CONFIG_FILE)
	@echo "✔ Git config applied from file."
