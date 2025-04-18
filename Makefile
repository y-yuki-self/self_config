GIT_CONFIG_FILE=./git/global_setting

.PHONY: install-any-tools
install-any-tools: install-brew install-mise install-peco install-jq install-tree install-lsd

.PHONY: brew
install-brew:
	@echo "Checking if brew is installed..."
	@if command -v brew >/dev/null 2>&1; then \
		echo "✔ brew is already installed."; \
	else \
		echo "❌ brew not found. Installing..."; \
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Home^Cew/install/HEAD/install.sh)"; \
		echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc; \
		source ~/.bashrc; \
		echo "✔ brew is installed!"; \
	fi

.PHONY: mise
install-mise:
	@echo "Checking if mise is installed..."
	@if command -v mise >/dev/null 2>&1; then \
		echo "✔ mise is already installed."; \
	else \
		echo "❌ mise not found. Installing..."; \
		brew install mise; \
		echo "✔ mise is installed!"; \
	fi

.PHONY: peco
install-peco:
	@echo "Checking if peco is installed..."
	@if command -v peco >/dev/null 2>&1; then \
		echo "✔ peco is already installed."; \
	else \
		echo "❌ peco not found. Installing..."; \
		brew install peco; \
		echo "✔ peco is installed!"; \
	fi

.PHONY: jq
install-jq:
	@echo "Checking if jq is installed..."
	@if command -v jq >/dev/null 2>&1; then \
		echo "✔ jq is already installed."; \
	else \
		echo "❌ jq not found. Installing..."; \
		brew install jq; \
		echo "✔ jq is installed!"; \
	fi

.PHONY: tree
install-tree:
	@echo "Checking if tree is installed..."
	@if command -v tree >/dev/null 2>&1; then \
		echo "✔ tree is already installed."; \
	else \
		echo "❌ tree not found. Installing..."; \
		brew install tree; \
		echo "✔ tree is installed!"; \
	fi

.PHONY: lsd
install-lsd:
	@echo "Checking if lsd is installed..."
	@if command -v lsd >/dev/null 2>&1; then \
		echo "✔ lsd is already installed."; \
	else \
		echo "❌ lsd not found. Installing..."; \
		brew install lsd; \
		echo "✔ lsd is installed!"; \
	fi



.PHONY: check-fish install-fish
# OSごとのインストールコマンド（必要に応じて拡張可）
install-fish:
	@echo "Checking if fish is installed..."
	@if command -v fish >/dev/null 2>&1; then \
		echo "✔ fish is already installed."; \
	else \
		echo "❌ fish not found. Installing..."; \
		sudo apt-add-repository ppa:fish-shell/release-3; \
		sudo apt update && sudo apt install fish -y; \
		fish; \
		chsh -s /usr/bin/fish; \
		echo "✔ fish is installed!"; \
		echo "copy fish config"; \
		cp -f ~/.config/fish/config.fish ~/.config/fish/config.fish.bak; \
		cp -f ./fish/config.fish ~/.config/fish/; \
		source ~/.config/fish/config.fish; \
	fi
	@echo "Checking if fisher is installed..."
	@fish -c 'if not functions -q fisher; \
		echo "❌ fisher not found. Installing..."; \
		curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source; \
		fisher install jorgebucaran/fisher; \
	else; \
		echo "✔ fisher is already installed."; \
	end'
	@echo "Installing fisher plugins..."
	@fish -c 'fisher install oh-my-fish/theme-bobthefish 0rax/fish-bd jethrokuan/z edc/bass'
	@echo "✔ All plugins installed!"


.PHONY: git-config-from-file
git-config-from-file:
	@echo "Applying git config from $(GIT_CONFIG_FILE)..."
	@while IFS== read -r key value; do \
		if [ -n "$$key" ] && [ -n "$$value" ]; then \
			echo "Setting: $$key = $$value"; \
			git config --global "$$key" "$$value"; \
		fi; \
	done < $(GIT_CONFIG_FILE)
	@echo "✔ Git config applied from file."
