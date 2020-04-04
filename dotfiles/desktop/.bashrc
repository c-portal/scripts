#
# ~/.bashrc
#

# If running on /dev/tty1, startx (executes ~/.xinitrc)
if [ "$(tty)" = '/dev/tty1' ]; then
    startx
    exit $?
fi

# Variables
EDITOR=nano
HISTSIZE=10000
HISTFILE="/tmp/.bash_history.$USER"

# Ensure history file safe
touch "$HISTFILE"
chmod 600 "$HISTFILE"

# Shell PS1
PS1=$'\033[01;32m$USER\033[00m @ \033[01;34m$(if echo "$PWD" | grep -q -E "^$HOME"; then echo "$PWD" | sed -e "s|^$HOME|~|g"; else echo "$PWD"; fi)\033[00m
--> '

# User bin path
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

# Odin
[ -d "$HOME/.odin" ] && PATH="$HOME/.odin:$PATH"

# Alias
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cat="bat --style=plain --color auto"
alias clear='clear -x'
alias restart-firefox='pkill firefox && (firefox &) > /dev/null 2>&1'

# Export variables
export HISTSIZE HISTFILESIZE HISTFILE EDITOR PS1 PATH

# Load Keychain
eval `keychain_desktop ~/.ssh/id_ecdsa`
eval `keychain_desktop ~/.ssh/id_rsa`

# Motd
[ -x ~/.motd ] && . ~/.motd
