#####################################################
# status barの設定
#####################################################
# Detect OS
set OS (uname)

if status is-interactive
    set -g theme_date_format "+%Y-%m-%d %H:%M:%S" # 日付のフォーマットを変更(例： 2022-03-01 23:22:22)
    set -g fish_prompt_pwd_dir_length 0           # フォルダ名が省略されていたものを省略しなくする
    if test "$OS" = "Darwin"
        eval (/opt/homebrew/bin/brew shellenv)
    end
    # Commands to run in interactive sessions can go here
end


# macOS の場合
if test "$OS" = "Darwin"
    echo "Setting up for macOS"
    # brew path
    set -x PATH "/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
end
# Linux の場合（さらに WSL チェック）
if test "$OS" = "Linux"
    if grep -qEi "(Microsoft|WSL)" /proc/version
        echo "Setting up for WSL"
    else
        echo "Setting up for Linux"
    end
    # brew path
    set -x PATH "/home/linuxbrew/.linuxbrew/bin:$PATH"
end

# set color
#set fish_color_command brue

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
set HISTCONTROL ignoreboth

# append to the history file, don't overwrite it
# shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
set HISTSIZE 1000
set HISTFILESIZE 2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
# shopt -s checkwinsize

# some more ls aliases
alias ll='lsd -alF'
alias la='lsd -A'
alias l='lsd -CF'

# alias vi='nvim'
# alias lgit='lazygit'

alias fish_config_edit='vi ~/.config/fish/config.fish'
alias fish_config_read='source ~/.config/fish/config.fish'

alias awsp="source _awsp"

# language code
set -x LC_ALL en_US.UTF-8

# -------------------------
# pecoの設定
# -------------------------
function fish_user_key_bindings
    bind \cr peco_select_history
end


# -------------------------
# mise用の設定
# -------------------------
eval (mise activate fish)
