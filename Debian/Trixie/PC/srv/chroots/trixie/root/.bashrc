# ~/.bashrc: executed by bash(1) for non-login shells.

# Prompt style from a single file
PROMPT_STYLE_FILE="/root/.bash_prompt_style"
[ -f "$PROMPT_STYLE_FILE" ] || echo "PROMPT_STYLE=classic" > "$PROMPT_STYLE_FILE"
source "$PROMPT_STYLE_FILE"

# Colors
RESET="\[\e[0m\]"; BOLD="\[\e[1m\]"
BLACK="\[\e[30m\]"; RED="\[\e[31m\]"; GREEN="\[\e[32m\]"; YELLOW="\[\e[33m\]"; BLUE="\[\e[34m\]"; MAGENTA="\[\e[35m\]"; CYAN="\[\e[36m\]"; WHITE="\[\e[37m\]"
BG_BLACK="\[\e[40m\]"; BG_RED="\[\e[41m\]"; BG_GREEN="\[\e[42m\]"; BG_YELLOW="\[\e[43m\]"; BG_BLUE="\[\e[44m\]"; BG_MAGENTA="\[\e[45m\]"; BG_CYAN="\[\e[46m\]"; BG_WHITE="\[\e[47m\]"
BRIGHT_BLACK="\[\e[90m\]"; BRIGHT_RED="\[\e[91m\]"; BRIGHT_GREEN="\[\e[92m\]"; BRIGHT_YELLOW="\[\e[93m\]"; BRIGHT_BLUE="\[\e[94m\]"; BRIGHT_MAGENTA="\[\e[95m\]"; BRIGHT_CYAN="\[\e[96m\]"; BRIGHT_WHITE="\[\e[97m\]"
BG_BRIGHT_BLACK="\[\e[100m\]"; BG_BRIGHT_RED="\[\e[101m\]"; BG_BRIGHT_GREEN="\[\e[102m\]"; BG_BRIGHT_YELLOW="\[\e[103m\]"; BG_BRIGHT_BLUE="\[\e[104m\]"; BG_BRIGHT_MAGENTA="\[\e[105m\]"; BG_BRIGHT_CYAN="\[\e[106m\]"; BG_BRIGHT_WHITE="\[\e[107m\]"

# Note: PS1 is set in /etc/profile, and the default umask is defined in /etc/login.defs.
# You should not need this unless you want different defaults for root.
__save_exit_status() { LAST_EXIT_CODE=$?; }
__git_branch() {
    local branch ahead behind marks=""
    git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { echo -n "~"; return; }
    branch="$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --always 2>/dev/null)"
    if git rev-parse --abbrev-ref --symbolic-full-name @{u} >/dev/null 2>&1; then
        ahead="$(git rev-list --count @{u}..HEAD 2>/dev/null)"
        behind="$(git rev-list --count HEAD..@{u} 2>/dev/null)"
        [ "$behind" -gt 0 ] && marks+=" ⇣$behind"
        [ "$ahead" -gt 0 ] && marks+=" ⇡$ahead"
    fi
    echo -n "$branch$marks"
}
__venv_segment() {
    if [ -n "$VIRTUAL_ENV" ]; then
        basename "$VIRTUAL_ENV"
    else
        echo "~"
    fi
}
__update_prompt() {
    # TTY Prompt
    case "$(tty)" in
        /dev/tty[0-9]*)
            prompt_style_default
            return
        ;;
    esac
    # Visual Studio Code Prompt
    if [ "$TERM_PROGRAM" = "vscode" ]; then PS1=''; return; fi
    # Apply prompt style
    case "$PROMPT_STYLE" in
        fancy) prompt_style_fancy ;;
        classic) prompt_style_classic ;;
        default) prompt_style_default ;;
        *) prompt_style_default ;;
    esac
}
PROMPT_COMMAND="__save_exit_status; __update_prompt"
prompt_style_fancy() {
    local R BK BR BG BY BB BM BW
    R="${RESET}"; BK="${BG_BLACK}"; BR="${BG_RED}"; BG="${BG_GREEN}"; BY="${BG_YELLOW}"; BB="${BG_BLUE}"; BM="${BG_MAGENTA}"; BW="${BG_WHITE}"
    PS1="${WHITE}${BW}${RED}᠎${BB}${WHITE}${R}\
${BB}${WHITE}  \W ${BM}${BLUE}${R}\
${BM}${WHITE} 󰊢 \$(__git_branch) ${BG}${MAGENTA}${R}\
${BG}${WHITE}  \$(__venv_segment) ${debian_chroot:+${BR}${GREEN}${R}\
${BR}${WHITE} ᠎ ${debian_chroot} }${BY}${RED}${R}\
${BY}${WHITE}  ${R}${YELLOW}${R} "
}
prompt_style_classic() {
    local R B BK BR BG BY BB BM
    R="${RESET}"; B="${BOLD}"; BK="${BRIGHT_BLACK}"; BR="${BRIGHT_RED}"; BG="${BRIGHT_GREEN}"; BY="${BRIGHT_YELLOW}"; BB="${BRIGHT_BLUE}"; BM="${BRIGHT_MAGENTA}"
    PS1="┌╴${B}\u${R}@\H[${BB}\W${R}]{${BM}\$(__git_branch)${R}}(${BG}\$(__venv_segment)${R})${debian_chroot:+(${BR}${debian_chroot}${R})}\n└\$([[ $LAST_EXIT_CODE -eq 0 ]] && echo "─" || echo "✘")╴${BK}\A${R}╶╴${BY}\$${R} "
}
prompt_style_default() {
    PS1='($(__venv_segment))${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    # PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
}
__update_prompt
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
