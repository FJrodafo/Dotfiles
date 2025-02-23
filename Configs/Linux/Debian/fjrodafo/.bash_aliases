# Script
alias backup='$HOME/.backup.sh'
alias dockerupmysqlphpmyadmin='$HOME/Documents/Dev/FJrodafo/Repositories/Dotfiles/Scripts/Docker/mysql-phpmyadmin/up.sh'
alias dockerdownmysqlphpmyadmin='$HOME/Documents/Dev/FJrodafo/Repositories/Dotfiles/Scripts/Docker/mysql-phpmyadmin/down.sh'
alias dockeruporacle='$HOME/Documents/Dev/FJrodafo/Repositories/Dotfiles/Scripts/Docker/oracle/up.sh'
alias dockerdownoracle='$HOME/Documents/Dev/FJrodafo/Repositories/Dotfiles/Scripts/Docker/oracle/down.sh'
alias dockeruptodo='$HOME/Documents/Dev/FJrodafo/Repositories/Dotfiles/Scripts/Docker/to-do/up.sh'
alias dockerdowntodo='$HOME/Documents/Dev/FJrodafo/Repositories/Dotfiles/Scripts/Docker/to-do/down.sh'
alias ijavajavac='$HOME/Documents/Dev/FJrodafo/Repositories/Dotfiles/Scripts/Installers/install_java_and_javac.sh'
alias inodenpm='$HOME/Documents/Dev/FJrodafo/Repositories/Dotfiles/Scripts/Installers/install_node_and_npm.sh'
alias loading='$HOME/Documents/Dev/FJrodafo/Repositories/Dotfiles/Scripts/Miscellaneous/spinner.sh'
alias startxuniversaldriverssetup='$HOME/Documents/Dev/FJrodafo/Repositories/Dotfiles/Scripts/Drivers/universal.sh'
alias startxnvidiadriverssetup='$HOME/Documents/Dev/FJrodafo/Repositories/Dotfiles/Scripts/Drivers/nvidia.sh'
alias updatelinuxkernel='$HOME/Documents/Dev/FJrodafo/Repositories/Dotfiles/Scripts/Kernel/update.sh'
# Discord
alias discordcrps='cd $HOME/Documents/Dev/FJrodafo/Repositories/DiscordCRPS/App && npm i && npm start'
alias discordcrpscanary='cd $HOME/Documents/Dev/FJrodafo/Repositories/DiscordCRPS/App && npm i && npm run canary'
alias discordapp='cd $HOME/Documents/Dev/FJrodafo/Repositories/DiscordAPP/App && npm i && npm start'
alias discordappcanary='cd $HOME/Documents/Dev/FJrodafo/Repositories/DiscordAPP/App && npm i && npm run canary'
alias discordappshrikebot='cd $HOME/Documents/Dev/FJrodafo/Repositories/DiscordAPP/App && npm i && npm run shrikebot'
# App
alias eclipse='$HOME/eclipse/eclipse'
alias sqldeveloper='$HOME/sqldeveloper/sqldeveloper.sh'
alias xampp='sudo /opt/lampp/manager-linux-x64.run'
# Terminal
alias audiovisualizer='cava -p ~/.config/cava/config'
alias damnit='sudo $(history -p !!)'
alias interactiveprocessviewer='htop'
# Neofetch
alias neofetchbunny='neofetch --ascii $(find $HOME/.config/neofetch/bunny/ascii/ -type f -name "*.txt" | shuf -n 1) --config $HOME/.config/neofetch/bunny/config.conf'
alias neofetchdefault='neofetch --config $HOME/.config/neofetch/config.conf'
alias neofetchminimal='neofetch --ascii $(find $HOME/.config/neofetch/minimal/ascii/ -type f -name "*.txt" | shuf -n 1) --config $HOME/.config/neofetch/minimal/config.conf'
alias neofetchnerd='neofetch --ascii $(find $HOME/.config/neofetch/nerd/ascii/ -type f -name "*.txt" | shuf -n 1) --config $HOME/.config/neofetch/nerd/config.conf'
# Java
alias basex='java -jar $HOME/Documents/Estudios/DAW/LND/Tema6/BaseX104.jar'
alias saxon='java -jar $HOME/Documents/Estudios/DAW/LND/Tema5/saxon-he-11.4/saxon-he-11.4.jar'
# Node
alias npkill='npx npkill -s size'
# VPN
alias hunsterverse='cd $HOME/Documents/Games/Servers/HunsterVerse && sudo openvpn --config furanyu-1710367744__HVMAIN.ovpn'
# Networks
alias airplanemodeon='nmcli networking off' # alias airplanemodeon='nmcli radio all off'
alias airplanemodeoff='nmcli networking on' # alias airplanemodeoff='nmcli radio all on'
# System Audio
alias audiooutputdefault='amixer set Master 40%'
alias audiooutputdown='amixer set Master 5%-'
alias audiooutputup='amixer set Master 5%+'
alias audiooutputdeafen='amixer set Master toggle'
alias audioinputdefault='amixer set Capture 40%'
alias audioinputdown='amixer set Capture 5%-'
alias audioinputup='amixer set Capture 5%+'
alias audioinputdeafen='amixer set Capture toggle'
# System Brightness
alias brightnessdefault='brightnessctl s 70%'
alias brightnessdown='brightnessctl s 5%-'
alias brightnessup='brightnessctl s 5%+'
# System Power Menu
alias poff='systemctl poweroff'
alias preboot='systemctl reboot'
alias psuspend='systemctl suspend'
alias phibernate='systemctl hibernate'
alias phybridsleep='systemctl hybrid-sleep'
alias plogout='loginctl kill-session self'
