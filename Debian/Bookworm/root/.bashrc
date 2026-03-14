# ~/.bashrc: executed by bash(1) for non-login shells.

# Colors
RESET="\[\e[0m\]"
BLACK="\[\e[30m\]"
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
YELLOW="\[\e[33m\]"
BLUE="\[\e[34m\]"
MAGENTA="\[\e[35m\]"
CYAN="\[\e[36m\]"
WHITE="\[\e[37m\]"
BOLD="\[\e[1m\]"
BRIGHTBLACK="\[\e[90m\]"
BRIGHTRED="\[\e[91m\]"
BRIGHTGREEN="\[\e[92m\]"
BRIGHTYELLOW="\[\e[93m\]"
BRIGHTBLUE="\[\e[94m\]"
BRIGHTMAGENTA="\[\e[95m\]"
BRIGHTCYAN="\[\e[96m\]"
BRIGHTWHITE="\[\e[97m\]"

# Git branch
parse_git_branch() {
    git symbolic-ref --short HEAD 2>/dev/null || echo '~'
}

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
PS1="╭╴${BOLD}\u${RESET}@\H[${BRIGHTBLUE}\W${RESET}]{${BRIGHTMAGENTA}\$(parse_git_branch)${RESET}}${debian_chroot:+(${BRIGHTRED}${debian_chroot}${RESET})}\n╰─╴${BRIGHTBLACK}\A${RESET}╶╴${BRIGHTYELLOW}#${RESET} "
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "$(dircolors)"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'

# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
