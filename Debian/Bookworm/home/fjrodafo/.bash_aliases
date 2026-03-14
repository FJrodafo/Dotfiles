#  ╔═╗┌─┐┬─┐┬┌─┐┌┬┐
#  ╚═╗│  ├┬┘│├─┘ │
#  ╚═╝└─┘┴└─┴┴   ┴
alias backup='$HOME/Scripts/.backup.sh'
alias dockerupmysqlphpmyadmin='$HOME/Scripts/docker/mysql-phpmyadmin/up.sh'
alias dockerdownmysqlphpmyadmin='$HOME/Scripts/docker/mysql-phpmyadmin/down.sh'
alias dockeruporacle='$HOME/Scripts/docker/oracle/up.sh'
alias dockerdownoracle='$HOME/Scripts/docker/oracle/down.sh'
alias dockeruptodo='$HOME/Scripts/docker/to-do/up.sh'
alias dockerdowntodo='$HOME/Scripts/docker/to-do/down.sh'
alias ijavajavac='$HOME/Scripts/installers/install_java_and_javac.sh'
alias inodenpm='$HOME/Scripts/installers/install_node_and_npm.sh'
alias loading='$HOME/Scripts/miscellaneous/spinner.sh'
alias loremipsum='$HOME/Scripts/miscellaneous/lorem_ipsum.sh'
alias nginxsync='sudo $HOME/Scripts/nginx/nginx_sync.sh'
alias sortcontacts='$HOME/Scripts/miscellaneous/text_files/sort_text_file.sh $HOME/Documents/Contacts/phone.csv'
alias sortvehicles='$HOME/Scripts/miscellaneous/text_files/sort_text_file.sh $HOME/Documents/Vehicles/YouTube.txt'
alias startxuniversaldrivers='$HOME/Scripts/drivers/universal.sh'
alias startxnvidiadrivers='$HOME/Scripts/drivers/nvidia.sh'
alias sudoapt='$HOME/Scripts/apt/update.sh'
alias updatelinuxkernel='$HOME/Scripts/Kernel/update.sh'
#  ╔╦╗┬┌─┐┌─┐┌─┐┬─┐┌┬┐
#   ║║│└─┐│  │ │├┬┘ ││
#  ═╩╝┴└─┘└─┘└─┘┴└──┴┘
alias discordcrps='cd $HOME/Documents/Dev/FJrodafo/Repositories/DiscordCRPS/App && npm i && npm start'
alias discordcrpscanary='cd $HOME/Documents/Dev/FJrodafo/Repositories/DiscordCRPS/App && npm i && npm run canary'
alias discordapp='cd $HOME/Documents/Dev/FJrodafo/Repositories/DiscordAPP/App && npm i && npm start'
alias discordappcanary='cd $HOME/Documents/Dev/FJrodafo/Repositories/DiscordAPP/App && npm i && npm run canary'
alias discordappshrikebot='cd $HOME/Documents/Dev/FJrodafo/Repositories/ShrikeBot/App && npm i && npm run start'
#  ╔═╗┌─┐┌─┐
#  ╠═╣├─┘├─┘
#  ╩ ╩┴  ┴
alias filezilla3='$HOME/.FileZilla3/bin/filezilla'
alias sqldeveloper='$HOME/sqldeveloper/sqldeveloper.sh'
alias xampp='sudo /opt/lampp/manager-linux-x64.run'
#  ╔╦╗┌─┐┬─┐┌┬┐┬┌┐┌┌─┐┬
#   ║ ├┤ ├┬┘│││││││├─┤│
#   ╩ └─┘┴└─┴ ┴┴┘└┘┴ ┴┴─┘
alias clean='clear && source ~/.bashrc'
alias chrootbookworm='sudo schroot -c bookworm --directory=/root'
alias audiovisualizer='cava -p ~/.config/cava/config'
alias damnit='sudo $(history -p !!)'
alias keww='pkill eww'
alias interactiveprocessviewer='htop'
alias music='mpv --shuffle --no-audio-display ~/Music'
#  ╔╗╔┌─┐┌─┐┌─┐┌─┐┌┬┐┌─┐┬ ┬
#  ║║║├┤ │ │├┤ ├┤  │ │  ├─┤
#  ╝╚╝└─┘└─┘└  └─┘ ┴ └─┘┴ ┴
alias neofetchbunny='neofetch --config $HOME/.config/neofetch/bunny/config.conf --ascii $(find $HOME/.config/neofetch/bunny/ascii/ -type f -name "*.txt" | shuf -n 1)'
alias neofetchdebian='neofetch --config $HOME/.config/neofetch/debian/config.conf --ascii $HOME/.config/neofetch/debian/ascii.txt'
alias neofetchdefault='neofetch --config $HOME/.config/neofetch/config.conf'
alias neofetchminimal='neofetch --config $HOME/.config/neofetch/minimal/config.conf --ascii $(find $HOME/.config/neofetch/minimal/ascii/ -type f -name "*.txt" | shuf -n 1)'
alias neofetchnerd='neofetch --config $HOME/.config/neofetch/nerd/config.conf --ascii $(find $HOME/.config/neofetch/nerd/ascii/ -type f -name "*.txt" | shuf -n 1)'
#   ╦┌─┐┬  ┬┌─┐
#   ║├─┤└┐┌┘├─┤
#  ╚╝┴ ┴ └┘ ┴ ┴
alias basex='java -jar $HOME/Documents/Estudios/DAW/LND/Tema6/BaseX104.jar'
alias saxon='java -jar $HOME/Documents/Estudios/DAW/LND/Tema5/saxon-he-11.4/saxon-he-11.4.jar'
#  ╦  ╦╔═╗╔╗╔
#  ╚╗╔╝╠═╝║║║
#   ╚╝ ╩  ╝╚╝
alias hunsterverse='cd $HOME/Documents/Games/Servers/HunsterVerse && sudo openvpn --config furanyu-1710367744__HVMAIN.ovpn'
#  ╔╗╔┌─┐┌┬┐┬ ┬┌─┐┬─┐┬┌─┌─┐
#  ║║║├┤  │ ││││ │├┬┘├┴┐└─┐
#  ╝╚╝└─┘ ┴ └┴┘└─┘┴└─┴ ┴└─┘
alias airplanemodeon='nmcli networking off'
#alias airplanemodeon='nmcli radio all off'
alias airplanemodeoff='nmcli networking on'
#alias airplanemodeoff='nmcli radio all on'
#  ╔═╗┬ ┬┌─┐┌┬┐┌─┐┌┬┐  ╔═╗┬ ┬┌┬┐┬┌─┐
#  ╚═╗└┬┘└─┐ │ ├┤ │││  ╠═╣│ │ ││││ │
#  ╚═╝ ┴ └─┘ ┴ └─┘┴ ┴  ╩ ╩└─┘─┴┘┴└─┘
alias audiooutputdefault='amixer set Master 40%'
alias audiooutputdown='amixer set Master 5%-'
alias audiooutputup='amixer set Master 5%+'
alias audiooutputdeafen='amixer set Master toggle'
alias audioinputdefault='amixer set Capture 40%'
alias audioinputdown='amixer set Capture 5%-'
alias audioinputup='amixer set Capture 5%+'
alias audioinputdeafen='amixer set Capture toggle'
#  ╔═╗┬ ┬┌─┐┌┬┐┌─┐┌┬┐  ╔╗ ┬─┐┬┌─┐┬ ┬┌┬┐┌┐┌┌─┐┌─┐┌─┐
#  ╚═╗└┬┘└─┐ │ ├┤ │││  ╠╩╗├┬┘││ ┬├─┤ │ │││├┤ └─┐└─┐
#  ╚═╝ ┴ └─┘ ┴ └─┘┴ ┴  ╚═╝┴└─┴└─┘┴ ┴ ┴ ┘└┘└─┘└─┘└─┘
alias brightnessdefault='brightnessctl s 70%'
alias brightnessdown='brightnessctl s 5%-'
alias brightnessup='brightnessctl s 5%+'
#  ╔═╗┬ ┬┌─┐┌┬┐┌─┐┌┬┐  ╔═╗┌─┐┬ ┬┌─┐┬─┐
#  ╚═╗└┬┘└─┐ │ ├┤ │││  ╠═╝│ ││││├┤ ├┬┘
#  ╚═╝ ┴ └─┘ ┴ └─┘┴ ┴  ╩  └─┘└┴┘└─┘┴└─
alias poff='systemctl poweroff'
alias sreboot='systemctl reboot'
alias ssuspend='systemctl suspend'
#alias shibernate='systemctl hibernate'
#alias shybridsleep='systemctl hybrid-sleep'
alias slogout='loginctl kill-session self'
