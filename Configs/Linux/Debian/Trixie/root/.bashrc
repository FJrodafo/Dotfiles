# ~/.bashrc: executed by bash(1) for non-login shells.

# Prompt style from a single file
PROMPT_STYLE_FILE="/home/fjrodafo/.bash_prompt_style"
source "$PROMPT_STYLE_FILE"

# Colors
RESET="\[\e[0m\]"; BOLD="\[\e[1m\]"
BLACK="\[\e[30m\]"; RED="\[\e[31m\]"; GREEN="\[\e[32m\]"; YELLOW="\[\e[33m\]"; BLUE="\[\e[34m\]"; MAGENTA="\[\e[35m\]"; CYAN="\[\e[36m\]"; WHITE="\[\e[37m\]"
BG_BLACK="\[\e[40m\]"; BG_RED="\[\e[41m\]"; BG_GREEN="\[\e[42m\]"; BG_YELLOW="\[\e[43m\]"; BG_BLUE="\[\e[44m\]"; BG_MAGENTA="\[\e[45m\]"; BG_CYAN="\[\e[46m\]"; BG_WHITE="\[\e[47m\]"
BRIGHT_BLACK="\[\e[90m\]"; BRIGHT_RED="\[\e[91m\]"; BRIGHT_GREEN="\[\e[92m\]"; BRIGHT_YELLOW="\[\e[93m\]"; BRIGHT_BLUE="\[\e[94m\]"; BRIGHT_MAGENTA="\[\e[95m\]"; BRIGHT_CYAN="\[\e[96m\]"; BRIGHT_WHITE="\[\e[97m\]"
BG_BRIGHT_BLACK="\[\e[100m\]"; BG_BRIGHT_RED="\[\e[101m\]"; BG_BRIGHT_GREEN="\[\e[102m\]"; BG_BRIGHT_YELLOW="\[\e[103m\]"; BG_BRIGHT_BLUE="\[\e[104m\]"; BG_BRIGHT_MAGENTA="\[\e[105m\]"; BG_BRIGHT_CYAN="\[\e[106m\]"; BG_BRIGHT_WHITE="\[\e[107m\]"

# Git branch
git_branch() {
    git symbolic-ref --short HEAD 2>/dev/null \
    || git describe --tags --always 2>/dev/null \
    || echo '~'
}

# Note: PS1 is set in /etc/profile, and the default umask is defined in /etc/login.defs.
# You should not need this unless you want different defaults for root.
prompt_style_fancy() {
    local R BH BR BY BB BM
    R="${RESET}"; BH="${BG_BLACK}"; BR="${BG_RED}"; BY="${BG_YELLOW}"; BB="${BG_BLUE}"; BM="${BG_MAGENTA}"
    PS1="${BB}  \W ${BM}${BLUE}${R}${BM} 󰊢 \$(git_branch) ${debian_chroot:+${BR}${MAGENTA}${R}${BR} 󰌽 ${debian_chroot} }${BY}${RED}${R}${BY}  ${R}${YELLOW}${R} "
}
prompt_style_classic() {
    local R B BH BR BY BB BM
    R="${RESET}"; B="${BOLD}"; BH="${BRIGHT_BLACK}"; BR="${BRIGHT_RED}"; BY="${BRIGHT_YELLOW}"; BB="${BRIGHT_BLUE}"; BM="${BRIGHT_MAGENTA}"
    PS1="┌╴${B}\u${R}@\H[${BB}\W${R}]{${BM}\$(git_branch)${R}}${debian_chroot:+(${BR}${debian_chroot}${R})}\n└─╴${BH}\A${R}╶╴${BY}#${R} "
    #PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
}
case "$PROMPT_STYLE" in
    fancy) prompt_style_fancy ;;
    classic) prompt_style_classic ;;
    *) prompt_style_classic ;;
esac
if [ "$TERM_PROGRAM" == "vscode" ]; then PS1="┌╴\u@\h[${BRIGHT_BLUE}\W${RESET}]{${BRIGHT_MAGENTA}\$(git_branch)${RESET}}${debian_chroot:+(${BRIGHT_RED}${debian_chroot}${RESET})}\n└─╴${BRIGHT_BLACK}\A${RESET}╶╴${BRIGHT_YELLOW}#${RESET} "; fi
#umask 022

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
