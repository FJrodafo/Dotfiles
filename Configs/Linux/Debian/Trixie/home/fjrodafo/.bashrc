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

# Load PS1 modes from a single file
MODES_FILE="$HOME/.bash_modes"

# Create PS1 modes file with default values if it doesn't exist
if [ ! -f "$MODES_FILE" ]; then
    echo -e "fancy=false\nunknown=false" > "$MODES_FILE"
fi

# Source PS1 modes
source "$MODES_FILE"

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
RESET="\[\e[0m\]"; BOLD="\[\e[1m\]"
BLACK="\[\e[30m\]"; RED="\[\e[31m\]"; GREEN="\[\e[32m\]"; YELLOW="\[\e[33m\]"; BLUE="\[\e[34m\]"; MAGENTA="\[\e[35m\]"; CYAN="\[\e[36m\]"; WHITE="\[\e[37m\]"
BG_BLACK="\[\e[40m\]"; BG_RED="\[\e[41m\]"; BG_GREEN="\[\e[42m\]"; BG_YELLOW="\[\e[43m\]"; BG_BLUE="\[\e[44m\]"; BG_MAGENTA="\[\e[45m\]"; BG_CYAN="\[\e[46m\]"; BG_WHITE="\[\e[47m\]"
BRIGHT_BLACK="\[\e[90m\]"; BRIGHT_RED="\[\e[91m\]"; BRIGHT_GREEN="\[\e[92m\]"; BRIGHT_YELLOW="\[\e[93m\]"; BRIGHT_BLUE="\[\e[94m\]"; BRIGHT_MAGENTA="\[\e[95m\]"; BRIGHT_CYAN="\[\e[96m\]"; BRIGHT_WHITE="\[\e[97m\]"
BG_BRIGHT_BLACK="\[\e[100m\]"; BG_BRIGHT_RED="\[\e[101m\]"; BG_BRIGHT_GREEN="\[\e[102m\]"; BG_BRIGHT_YELLOW="\[\e[103m\]"; BG_BRIGHT_BLUE="\[\e[104m\]"; BG_BRIGHT_MAGENTA="\[\e[105m\]"; BG_BRIGHT_CYAN="\[\e[106m\]"; BG_BRIGHT_WHITE="\[\e[107m\]"

# Git branch
parse_git_branch() {
    git symbolic-ref --short HEAD 2>/dev/null || echo '~'
}

# Prompt
prompt_fancy() {
    local R BH BR BY BB BM
    R="${RESET}"; BH="${BG_BLACK}"; BR="${BG_RED}"; BY="${BG_YELLOW}"; BB="${BG_BLUE}"; BM="${BG_MAGENTA}"
    PS1="${BB}  \W ${BM}${BLUE}${R}${BM} 󰊢 \$(parse_git_branch) ${debian_chroot:+${BR}${MAGENTA}${R}${BR} 󰌽 ${debian_chroot} }${BY}${RED}${R}${BY}  ${R}${YELLOW}${R} "
}
prompt_classic() {
    local userhost
    local R BH BR BY BB BM
    R="${RESET}"; BH="${BRIGHT_BLACK}"; BR="${BRIGHT_RED}"; BY="${BRIGHT_YELLOW}"; BB="${BRIGHT_BLUE}"; BM="${BRIGHT_MAGENTA}"
    if [ "$unknown" = "true" ]; then userhost="unknown"; else userhost="\u@\h"; fi
    if [ "$color_prompt" = yes ]; then
        PS1="┌╴${userhost}[${BB}\W${R}]{${BM}\$(parse_git_branch)${R}}${debian_chroot:+(${BR}${debian_chroot}${R})}\n└─╴${BH}\A${R}╶╴${BY}\$${R} "
        #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    else
        PS1="┌╴${userhost}[\W]{\$(parse_git_branch)}${debian_chroot:+(${debian_chroot})}\n└─╴\A╶╴\$ "
        #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    fi
}
if [ "$fancy" = "true" ]; then prompt_fancy; else prompt_classic; fi
if [ "$TERM_PROGRAM" == "vscode" ]; then PS1="[${BRIGHT_BLUE}\W${RESET}]{${BRIGHT_MAGENTA}\$(parse_git_branch)${RESET}}${debian_chroot:+(${BRIGHT_RED}${debian_chroot}${RESET})}${BRIGHT_YELLOW}\$${RESET} "; fi
unset color_prompt force_color_prompt

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
if [ "$TERM" == "xterm-kitty" ]; then
    case $((RANDOM % 5)) in
        0) neofetch-bunny ;;
        1) neofetch-debian-braille ;;
        2) neofetch-debian-default ;;
        3) neofetch-debian-thin ;;
        4) neofetch-nerd ;;
    esac
fi

# Toggle PS1 mode
toggle_mode() {
    local mode="$1"
    source "$MODES_FILE"
    #if [ "${!mode}" = "true" ]; then declare "$mode=false"; else declare "$mode=true"; fi
    if [ "${!mode}" = "true" ]; then eval "$mode=false"; else eval "$mode=true"; fi
    echo -e "fancy=$fancy\nunknown=$unknown" > "$MODES_FILE"
    source ~/.bashrc
}
alias fancy-mode='toggle_mode fancy'
alias unknown-mode='toggle_mode unknown'
