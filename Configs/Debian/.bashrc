# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac


# Git branch
parse_git_branch() {
    # git rev-parse --abbrev-ref HEAD 2> /dev/null
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Git version push
function multipush() {
    read -p "Enter the version number (just the number): " version_number
    git add -A && git commit -m "v$version_number" && git push github && git push gitlab && git push bitbucket
}


# User prompt
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}╭╴\u@\h[\[\033[01;34m\]\W\[\033[00m\]]\[\033[01;33m\]$(parse_git_branch)\[\033[00m\]\n╰─╴\[\033[01;33m\]\$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}╭╴\u@\h[\W]$(parse_git_branch)\n╰─╴\$ '
fi


# Root prompt
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}╭╴\[\033[01;37m\]\u\[\033[00m\]@\h[\[\033[01;34m\]\W\[\033[00m\]]\[\033[01;33m\]$(parse_git_branch)\[\033[00m\]\n╰─╴\[\033[01;33m\]\$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}╭╴\u@\h[\W]$(parse_git_branch)\n╰─╴\$ '
fi


# Script
alias backup='$HOME/.Backup.sh'
alias changelog='$HOME/Documents/Repos/Dotfiles/Scripts/Git/changelog.sh'
alias dockerupmysqlphpmyadmin='$HOME/Documents/Repos/Dotfiles/Scripts/Docker/mysql-phpmyadmin/up.sh'
alias dockerdownmysqlphpmyadmin='$HOME/Documents/Repos/Dotfiles/Scripts/Docker/mysql-phpmyadmin/down.sh'
alias dockeruporacle='$HOME/Documents/Repos/Dotfiles/Scripts/Docker/oracle/up.sh'
alias dockerdownoracle='$HOME/Documents/Repos/Dotfiles/Scripts/Docker/oracle/down.sh'
alias ijavajavac='$HOME/Documents/Repos/Dotfiles/Scripts/Installers/install_java_and_javac.sh'
alias inodenpm='$HOME/Documents/Repos/Dotfiles/Scripts/Installers/install_node_and_npm.sh'
alias loading='$HOME/Documents/Repos/Dotfiles/Scripts/Miscellaneous/spinner.sh'
# Custom
alias bonsai='cbonsai --life 40 --multiplier 5 --time 20 --screensaver'
alias cl='clear && neofetch --ascii $HOME/Documents/Repos/Dotfiles/Configs/Neofetch/Ascii.txt'
alias multipush='multipush'
alias neofetch='neofetch --ascii $HOME/Documents/Repos/Dotfiles/Configs/Neofetch/Ascii.txt'
alias npkill='npx npkill -s size'
# App
alias eclipse='$HOME/eclipse/eclipse'
alias sqldeveloper='$HOME/sqldeveloper/sqldeveloper.sh'
alias xampp='sudo /opt/lampp/manager-linux-x64.run'
# Discord
alias discordapp='cd $HOME/Documents/Repos/DiscordAPP/App/src && npm start'
alias discordsample='cd $HOME/Documents/Repos/DiscordAPP/App/sample && npm start'
# Java
alias basex='java -jar $HOME/Documents/Estudios/DAW/LND/Tema6/BaseX104.jar'
alias saxon='java -jar $HOME/Documents/Estudios/DAW/LND/Tema5/saxon-he-11.4/saxon-he-11.4.jar'
# VPN
alias hunsterverse='cd $HOME/Documents/Games/Servers/HunsterVerse && sudo openvpn --config furanyu-1710367744__HVMAIN.ovpn'
# Export
export PATH=$PATH:$HOME/nodejs/bin
neofetch
