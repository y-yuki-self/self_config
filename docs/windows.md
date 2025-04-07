## Windows用初期設定

windowsのconsole環境構築

## ubuntuの稼働

#### powershell

```shell
wsl --install
```

## weztermのインストール

#### powershell

```shell
winget install wez.wezterm
```

## weztermの初期設定

※仮設定

#### ubuntu

```shell
cd /mnt/c/User/<<UserName>>/
mkdir -p .config/wezterm/
vi .config/wezterm/wezterm.lua
```

#### wezterm.lua

```lua
local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_domain = 'WSL:Ubuntu'
config.hide_tab_bar_if_only_one_tab = true
config.use_ime = true
config.color_scheme = 'Materia (base16)'
config.font_size = 12
config.window_close_confirmation = 'AlwaysPrompt'
config.enable_scroll_bar = true
config.initial_rows = 36
config.initial_cols = 120
config.default_cursor_style = 'BlinkingUnderline'

return config
```

## homebrewのインストール

### ubuntu

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install gcc
```

