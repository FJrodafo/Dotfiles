#  ╔═╗┌─┐┬─┐┬┌─┐┌┬┐
#  ╚═╗│  ├┬┘│├─┘ │
#  ╚═╝└─┘┴└─┴┴   ┴
alias backup='$HOME/.backup.sh'
alias loading='$HOME/Documents/Dev/FJrodafo/Repositories/Dotfiles/Scripts/Miscellaneous/spinner.sh'
alias loremipsum='$HOME/Documents/Dev/FJrodafo/Repositories/Dotfiles/Scripts/Lorem_Ipsum/generator.sh'
alias sortcontacts='$HOME/Documents/Dev/FJrodafo/Repositories/Dotfiles/Scripts/Miscellaneous/text_files/sort_text_file.sh $HOME/Documents/Contacts/phone.csv'
alias sortvehicles='$HOME/Documents/Dev/FJrodafo/Repositories/Dotfiles/Scripts/Miscellaneous/text_files/sort_text_file.sh $HOME/Documents/Vehicles/YouTube.txt'
alias updatelinuxkernel='$HOME/Documents/Dev/FJrodafo/Repositories/Dotfiles/Scripts/Kernel/update.sh'
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
alias damnit='sudo $(history -p !!)'
alias music='mpv --shuffle --no-audio-display ~/Music'
#  ╔╗╔┌─┐┌─┐┌─┐┌─┐┌┬┐┌─┐┬ ┬
#  ║║║├┤ │ │├┤ ├┤  │ │  ├─┤
#  ╝╚╝└─┘└─┘└  └─┘ ┴ └─┘┴ ┴
alias neofetchbunny='neofetch --config $HOME/.config/neofetch/bunny/config.conf --ascii $(find $HOME/.config/neofetch/bunny/ascii/ -type f -name "*.txt" | shuf -n 1)'
alias neofetchdebian='neofetch --config $HOME/.config/neofetch/debian/config.conf --ascii $HOME/.config/neofetch/debian/ascii.txt'
alias neofetchdefault='neofetch --config $HOME/.config/neofetch/config.conf'
alias neofetchminimal='neofetch --config $HOME/.config/neofetch/minimal/config.conf --ascii $(find $HOME/.config/neofetch/minimal/ascii/ -type f -name "*.txt" | shuf -n 1)'
alias neofetchnerd='neofetch --config $HOME/.config/neofetch/nerd/config.conf --ascii $(find $HOME/.config/neofetch/nerd/ascii/ -type f -name "*.txt" | shuf -n 1)'
#  ╦  ╦╔═╗╔╗╔
#  ╚╗╔╝╠═╝║║║
#   ╚╝ ╩  ╝╚╝
alias hunsterverse='cd $HOME/Documents/Games/Servers/HunsterVerse && sudo openvpn --config furanyu-1710367744__HVMAIN.ovpn'
#  ╔═╗┬ ┬┌─┐┌┬┐┌─┐┌┬┐  ╔═╗┬ ┬┌┬┐┬┌─┐
#  ╚═╗└┬┘└─┐ │ ├┤ │││  ╠═╣│ │ ││││ │
#  ╚═╝ ┴ └─┘ ┴ └─┘┴ ┴  ╩ ╩└─┘─┴┘┴└─┘
alias systemaudiooutputdefault='amixer set Master 40%'
alias systemaudioinputdefault='amixer set Capture 40%'
#  ╔═╗┬ ┬┌─┐┌┬┐┌─┐┌┬┐  ╔═╗┌─┐┬ ┬┌─┐┬─┐
#  ╚═╗└┬┘└─┐ │ ├┤ │││  ╠═╝│ ││││├┤ ├┬┘
#  ╚═╝ ┴ └─┘ ┴ └─┘┴ ┴  ╩  └─┘└┴┘└─┘┴└─
alias poff='systemctl poweroff'
alias sreboot='systemctl reboot'
alias ssuspend='systemctl suspend'
#alias shibernate='systemctl hibernate'
#alias shybridsleep='systemctl hybrid-sleep'
