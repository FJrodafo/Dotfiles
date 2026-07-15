# ~/.bashrc: executed by bash(1) for non-login shells.

# Prompt style from a single file
PROMPT_STYLE_FILE="/home/fjrodafo/.bash_prompt_style"
source "$PROMPT_STYLE_FILE"

# Colors
[ -f /home/fjrodafo/.bash_colors ] && source /home/fjrodafo/.bash_colors

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
        locked) prompt_style_locked ;;
        thunder) prompt_style_thunder ;;
        icy) prompt_style_icy ;;
        fancy) prompt_style_fancy ;;
        kali) prompt_style_kali ;;
        classic) prompt_style_classic ;;
        default) prompt_style_default ;;
        *) prompt_style_default ;;
    esac
}
PROMPT_COMMAND="__save_exit_status; __update_prompt${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
prompt_style_locked() {
    local R BK BBK BW BY BBY
    R="${RESET}"; BK="${BRIGHT_BLACK}"; BBK="${BG_BRIGHT_BLACK}"; BW="${BRIGHT_WHITE}"; BY="${BRIGHT_YELLOW}"; BBY="${BG_BRIGHT_YELLOW}"
    PS1="${BK}${BBK}${BW}  \W ${R}${BK}${R}\
${BK}${BBK}${BW} 󰊢 \$(__git_branch) ${R}${BK}${R}\
${BY}${BBY}${BLACK}  ${R}${BY}${R} "
}
prompt_style_thunder() {
    local R BC BW BBW
    R="${RESET}"; BC="${BG_CYAN}"; BW="${BRIGHT_WHITE}"; BBW="${BG_BRIGHT_WHITE}"
    PS1="${BW}${BBW}${BLACK}  \W ${R}${BW}${R}\
${BW}${BBW}${BLACK} 󰊢 \$(__git_branch) ${R}${BW}${R}\
${CYAN}${BC}${BW}  ${R}${CYAN}${R} "
}
prompt_style_icy() {
    local R BB BC BW BBW
    R="${RESET}"; BB="${BG_BLUE}"; BC="${BG_CYAN}"; BW="${BRIGHT_WHITE}"; BBW="${BG_BRIGHT_WHITE}"
    PS1="${BW}${BBW}${BLACK}᠎${BB}${BW}${R}\
${BB}${BW} \u ${BC}${BLUE}${R}\
${BC}${BW} \H ${BBW}${CYAN}${R}\
${BBW}${BLACK} \W ${R}${BW}${R} "
}
prompt_style_fancy() {
    local R BK BR BG BY BB BM BW BBW
    R="${RESET}"; BK="${BG_BRIGHT_BLACK}"; BR="${BG_RED}"; BG="${BG_GREEN}"; BY="${BG_YELLOW}"; BB="${BG_BLUE}"; BM="${BG_MAGENTA}"; BW="${BRIGHT_WHITE}"; BBW="${BG_BRIGHT_WHITE}"
    PS1="${BW}${BBW}${RED}᠎${BK}${BW}${R}\
${BK}${BW} ᠎ \A ${BB}${BRIGHT_BLACK}${R}\
${BB}${BW}  \W ${BM}${BLUE}${R}\
${BM}${BW} 󰊢 \$(__git_branch) ${BG}${MAGENTA}${R}\
${BG}${BW}  \$(__venv_segment) ${debian_chroot:+${BR}${GREEN}${R}\
${BR}${BW} ᠎ ${debian_chroot} }${BY}${RED}${R}\
${BY}${BW}  ${R}${YELLOW}${R} "
}
prompt_style_kali() {
    PS1='\[\033[01;32m\]┌──(\[\033[01;94m\]\u㉿\h\[\033[01;32m\])─[\[\033[00m\]\w\[\033[01;32m\]]\[\033[00m\]($(__venv_segment))${debian_chroot:+($debian_chroot)}\n\[\033[01;32m\]└─\[\033[01;94m\]\$\[\033[00m\] '
    # PS1='┌──(\u㉿\h)─[\w]($(__venv_segment))${debian_chroot:+($debian_chroot)}\n└─\$ '
}
prompt_style_classic() {
    PS1='┌╴\[\033[01m\]\u\[\033[00m\]@\h[\[\033[94m\]\W\[\033[00m\]]{\[\033[95m\]$(__git_branch)\[\033[00m\]}(\[\033[92m\]$(__venv_segment)\[\033[00m\])${debian_chroot:+(\[\033[91m\]$debian_chroot\[\033[00m\])}\n└$([[ $LAST_EXIT_CODE -eq 0 ]] && echo "─" || echo "✘")╴\[\033[90m\]\A\[\033[00m\]╶╴\[\033[93m\]\$\[\033[00m\] '
    # PS1='┌╴\u@\h[\W]{$(__git_branch)}($(__venv_segment))${debian_chroot:+($debian_chroot)}\n└$([[ $LAST_EXIT_CODE -eq 0 ]] && echo "─" || echo "✘")╴\A╶╴\$ '
}
prompt_style_default() {
    PS1='($(__venv_segment))${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    # PS1='($(__venv_segment))${debian_chroot:+($debian_chroot)}\h:\w\$ '
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
