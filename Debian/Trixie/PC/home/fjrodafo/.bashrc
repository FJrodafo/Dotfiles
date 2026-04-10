# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Prompt style from a single file
PROMPT_STYLE_FILE="$HOME/.bash_prompt_style"
[ -f "$PROMPT_STYLE_FILE" ] || echo "PROMPT_STYLE=classic" > "$PROMPT_STYLE_FILE"
source "$PROMPT_STYLE_FILE"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color|xterm-kitty) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# Colors
[ -f ~/.bash_colors ] && source ~/.bash_colors

# Prompt
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
        thunder) prompt_style_thunder ;;
        icy) prompt_style_icy ;;
        fancy) prompt_style_fancy ;;
        kali) prompt_style_kali ;;
        classic) prompt_style_classic ;;
        default) prompt_style_default ;;
        *) prompt_style_default ;;
    esac
}
PROMPT_COMMAND="__save_exit_status; __update_prompt"
prompt_style_thunder() {
    local R BC BW BBW
    R="${RESET}"; BC="${BG_CYAN}"; BW="${BRIGHT_WHITE}"; BBW="${BG_BRIGHT_WHITE}"
    PS1="${BW}${BBW}${BLACK}  \W ${R}${BW}${R}\
${BW}${BBW}${BLACK} 󰊢 \$(__git_branch) ${R}${BW}${R}\
${CYAN}${BC}${BW}  ${R}${CYAN}${R} "
}
prompt_style_icy() {
    local R BB BC BW BBW
    R="${RESET}"; BB="${BG_BLUE}"; BC="${BG_CYAN}"; BW="${BRIGHT_WHITE}"; BBW="${BG_BRIGHT_WHITE}"
    PS1="${BW}${BBW}${BLACK}᠎${BB}${BW}${R}\
${BB}${BW} \u ${BC}${BLUE}${R}\
${BC}${BW} \h ${BBW}${CYAN}${R}\
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
${BY}${BW}  ${R}${YELLOW}${R} "
}
prompt_style_kali() {
    if [ "$color_prompt" = yes ]; then
        PS1='\[\033[01;32m\]┌──(\[\033[01;94m\]\u㉿\h\[\033[01;32m\])─[\[\033[00m\]\w\[\033[01;32m\]]\[\033[00m\]($(__venv_segment))${debian_chroot:+($debian_chroot)}\n\[\033[01;32m\]└─\[\033[01;94m\]\$\[\033[00m\] '
    else
        PS1='┌──(\u㉿\h)─[\w]($(__venv_segment))${debian_chroot:+($debian_chroot)}\n└─\$ '
    fi
}
prompt_style_classic() {
    if [ "$color_prompt" = yes ]; then
        PS1='┌╴\u@\h[\[\033[94m\]\W\[\033[00m\]]{\[\033[95m\]$(__git_branch)\[\033[00m\]}(\[\033[92m\]$(__venv_segment)\[\033[00m\])${debian_chroot:+(\[\033[91m\]$debian_chroot\[\033[00m\])}\n└$([[ $LAST_EXIT_CODE -eq 0 ]] && echo "─" || echo "✘")╴\[\033[90m\]\A\[\033[00m\]╶╴\[\033[93m\]\$\[\033[00m\] '
    else
        PS1='┌╴\u@\h[\W]{$(__git_branch)}($(__venv_segment))${debian_chroot:+($debian_chroot)}\n└$([[ $LAST_EXIT_CODE -eq 0 ]] && echo "─" || echo "✘")╴\A╶╴\$ '
    fi
}
prompt_style_default() {
    if [ "$color_prompt" = yes ]; then
        PS1='($(__venv_segment))${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    else
        PS1='($(__venv_segment))${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    fi
    #unset color_prompt force_color_prompt
}
__update_prompt
set_prompt_style() {
    PROMPT_STYLE="$1"
    echo "PROMPT_STYLE=$1" > "$PROMPT_STYLE_FILE"
}
alias thunder-prompt='set_prompt_style thunder'
alias icy-prompt='set_prompt_style icy'
alias fancy-prompt='set_prompt_style fancy'
alias kali-prompt='set_prompt_style kali'
alias classic-prompt='set_prompt_style classic'
alias default-prompt='set_prompt_style default'

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# some more alias to avoid making mistakes
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_aliases_private ]; then
    . ~/.bash_aliases_private
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Displays a random neofetch line
if [ "$TERM" = "xterm-kitty" ]; then
    case $((RANDOM % 5)) in
        0) neofetch-bunny ;;
        1) neofetch-debian-braille ;;
        2) neofetch-debian-default ;;
        3) neofetch-debian-thin ;;
        4) neofetch-nerd ;;
    esac
fi

export GPG_TTY=$(tty)
