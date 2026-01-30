#  ╔═╗┌─┐┬─┐┬┌─┐┌┬┐
#  ╚═╗│  ├┬┘│├─┘ │
#  ╚═╝└─┘┴└─┴┴   ┴
alias backup='$HOME/Scripts/backup.sh'
alias install-node-npm='$HOME/Scripts/install-node-npm.sh'
alias loading='$HOME/Scripts/loading.sh'
alias lorem-ipsum='$HOME/Scripts/lorem-ipsum.sh'
alias sort-text-file='$HOME/Scripts/sort-text-file.sh'
alias update-linux-kernel='$HOME/Scripts/update-linux-kernel.sh'
#  ╔╦╗┬┌─┐┌─┐┌─┐┬─┐┌┬┐
#   ║║│└─┐│  │ │├┬┘ ││
#  ═╩╝┴└─┘└─┘└─┘┴└──┴┘
alias discordapp='cd $HOME/Documents/Dev/FJrodafo/Repositories/DiscordAPP/App && npm i && npm start'
alias discordappcanary='cd $HOME/Documents/Dev/FJrodafo/Repositories/DiscordAPP/App && npm i && npm run canary'
alias discordappshrikebot='cd $HOME/Documents/Dev/FJrodafo/Repositories/ShrikeBot/App && npm i && npm run start'
alias discordcrps='cd $HOME/Documents/Dev/FJrodafo/Repositories/DiscordCRPS/App && npm i && npm start'
alias discordcrpscanary='cd $HOME/Documents/Dev/FJrodafo/Repositories/DiscordCRPS/App && npm i && npm run canary'
#  ╔╦╗┌─┐┬─┐┌┬┐┬┌┐┌┌─┐┬
#   ║ ├┤ ├┬┘│││││││├─┤│
#   ╩ └─┘┴└─┴ ┴┴┘└┘┴ ┴┴─┘
alias clean='clear && source ~/.bashrc'
alias chrootbookworm='sudo schroot -c bookworm --directory=/root'
alias damn='sudo $(history -p !!)'
alias music='mpv --shuffle --no-audio-display ~/Music'
#  ╔╗╔┌─┐┌─┐┌─┐┌─┐┌┬┐┌─┐┬ ┬
#  ║║║├┤ │ │├┤ ├┤  │ │  ├─┤
#  ╝╚╝└─┘└─┘└  └─┘ ┴ └─┘┴ ┴
alias neofetch-bunny='neofetch --config $HOME/.config/neofetch/bunny/config.conf --ascii $(find $HOME/.config/neofetch/bunny/ascii/ -type f -name "*.txt" | shuf -n 1)'
alias neofetch-debian='neofetch --config $HOME/.config/neofetch/debian/config.conf --ascii $HOME/.config/neofetch/debian/ascii.txt'
alias neofetch-default='neofetch --config $HOME/.config/neofetch/config.conf'
alias neofetch-minimal='neofetch --config $HOME/.config/neofetch/minimal/config.conf --ascii $(find $HOME/.config/neofetch/minimal/ascii/ -type f -name "*.txt" | shuf -n 1)'
alias neofetch-nerd='neofetch --config $HOME/.config/neofetch/nerd/config.conf --ascii $(find $HOME/.config/neofetch/nerd/ascii/ -type f -name "*.txt" | shuf -n 1)'
#  ╦  ╦╔═╗╔╗╔
#  ╚╗╔╝╠═╝║║║
#   ╚╝ ╩  ╝╚╝
alias hunsterverse='cd $HOME/Documents/Games/Servers/HunsterVerse && sudo openvpn --config furanyu-1710367744__HVMAIN.ovpn'
#  ╔═╗┬ ┬┌─┐┌┬┐┌─┐┌┬┐  ╔═╗┬ ┬┌┬┐┬┌─┐
#  ╚═╗└┬┘└─┐ │ ├┤ │││  ╠═╣│ │ ││││ │
#  ╚═╝ ┴ └─┘ ┴ └─┘┴ ┴  ╩ ╩└─┘─┴┘┴└─┘
alias audio-output-default='amixer set Master 40%'
alias audio-input-default='amixer set Capture 40%'
#  ╔═╗┬ ┬┌─┐┌┬┐┌─┐┌┬┐  ╔═╗┌─┐┬ ┬┌─┐┬─┐
#  ╚═╗└┬┘└─┐ │ ├┤ │││  ╠═╝│ ││││├┤ ├┬┘
#  ╚═╝ ┴ └─┘ ┴ └─┘┴ ┴  ╩  └─┘└┴┘└─┘┴└─
alias poff='systemctl poweroff'
alias sys-reboot='systemctl reboot'
#alias sys-suspend='systemctl suspend'
#alias sys-hibernate='systemctl hibernate'
#alias sys-hybridsleep='systemctl hybrid-sleep'
