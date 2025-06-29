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

# Unknown mode
unknown="false"
if [ -f "$HOME/.bash_unknown" ]; then
    unknown=$(cat "$HOME/.bash_unknown")
fi

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

# Git branch
parse_git_branch() {
    # git rev-parse --abbrev-ref HEAD 2> /dev/null
    git branch 2> /dev/null | grep -q '\*' && git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' || echo '~'
}

# Prompt
if [ "$unknown" = "true" ]; then
    PS1='${debian_chroot:+($debian_chroot)}╭╴\e[3munknown\e[0m@\h[\[\033[01;94m\]\W\[\033[00m\]](\[\033[01;95m\]$(parse_git_branch)\[\033[00m\])\n╰─╴\[\033[01;90m\]$(date +%H:%M)\[\033[00m\]╶╴\[\033[01;93m\]\$\[\033[00m\] '
elif [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}╭╴\u@\h[\[\033[01;94m\]\W\[\033[00m\]](\[\033[01;95m\]$(parse_git_branch)\[\033[00m\])\n╰─╴\[\033[01;90m\]$(date +%H:%M)\[\033[00m\]╶╴\[\033[01;93m\]\$\[\033[00m\] '
    # PS1='\W > '
else
    PS1='${debian_chroot:+($debian_chroot)}╭╴\u@\h[\W]$(parse_git_branch)\n╰─╴\$ '
    # PS1='\W > '
fi
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

# PATH
export PATH=$PATH:$HOME/.nodejs/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.eww/target/release

# Displays a random neofetch line
if [ "$TERM" == "xterm-kitty" ]; then
    case $((RANDOM % 4)) in
        0) neofetchbunny ;;
        1) neofetchdebian ;;
        2) neofetchminimal ;;
        3) neofetchnerd ;;
    esac
fi

# Enable/disable unknown mode
function toggle_unknown_mode() {
    # If the file does not exist, create it as false
    if [ ! -f "$HOME/.bash_unknown" ]; then
        echo false > "$HOME/.bash_unknown"
    fi

    current_state=$(cat "$HOME/.bash_unknown")

    if [ "$current_state" = "true" ]; then
        echo false > "$HOME/.bash_unknown"
    else
        echo true > "$HOME/.bash_unknown"
    fi

    clear && source ~/.bashrc
}
alias unknown=toggle_unknown_mode
