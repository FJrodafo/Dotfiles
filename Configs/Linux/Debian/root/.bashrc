# ~/.bashrc: executed by bash(1) for non-login shells.

# Git branch
parse_git_branch() {
    # git rev-parse --abbrev-ref HEAD 2> /dev/null
    git branch 2> /dev/null | grep -q '\*' && git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' || echo '~'
}

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
PS1='${debian_chroot:+($debian_chroot)}╭╴\[\033[01;97m\]\u\[\033[00m\]@\h[\[\033[01;94m\]\W\[\033[00m\]](\[\033[01;95m\]$(parse_git_branch)\[\033[00m\])\n╰─╴\[\033[01;90m\]$(date +%H:%M)\[\033[00m\]╶╴\[\033[01;93m\]\$\[\033[00m\] '
# PS1='\W # '
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
