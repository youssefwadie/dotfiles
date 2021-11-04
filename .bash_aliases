alias change-kernel='doas grub-set-default'

#use all cores
alias uac='sh ~/.bin/main/000*'
alias stress-test=s-tui

# switch graphic cards
alias tointel='optimus-manager --switch integrated'
alias tonvidia='optimus-manager --switch nvidia'
alias tohybrid='optimus-manager --switch hybrid'

#userlist
alias userlist='cut -d: -f1 /etc/passwd'

#fix obvious typo's
alias cd..='cd ..'
# systemd stuff
# alias start-virt='doas systemctl start libvirtd.service && doas virsh net-start default && virt-manager'

# get the error messages from journalctl
alias jctl='journalctl -p 3 -xb'

#maintenance
alias big='expac -H M "%m\t%n" | sort -h | nl'

#neovim for important configuration files
#know what you do in these files
alias ngrub='doas nvim /etc/default/grub'
alias nmkinitcpio='doas nvim /etc/mkinitcpio.conf'

# grub update
alias update-grub='doas grub-mkconfig -o /boot/grub/grub.cfg'

# switch between bash and zsh
# alias tobash="doas chsh $USER -s /bin/bash && echo 'Now log out.'"
# alias tozsh="doas chsh $USER -s /bin/zsh && echo 'Now log out.'"

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

# install and remove
alias i='doas pacman -Syu'
alias r='doas pacman -Rsn'
alias idep='doas pacman -Syu && doas pacman -S --asdeps'
alias q='pacman -Ss'

# update
alias u='doas pacman -Syu && paru -Qua'

#pacman unlock
alias unlock="doas rm /var/lib/pacman/db.lck"

#Cleanup orphaned packages
alias cleanup='pacman -Qtdq | doas pacman -Rsn -'

# update mirrors
alias mirrors='doas reflector --latest 10 --protocol http,https --sort rate --download-timeout 10 --save /etc/pacman.d/mirrorlist'

#list
alias l='ls --color=auto'
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias l.="ls -A | egrep '^\.'"
alias mv="mv -vi"
alias cp="cp -vi"

# Colorize the grep command output for ease of use (good for log files)##
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# Youtube Video
alias ytv-best='general_yt_dl_video best'
alias ytv-hd='general_yt_dl_video 22'
alias ytv-480='youtube_dl_480p'

# Youtube Playlist
alias ytp-best='general_yt_dl_playlist best'
alias ytp-hd='general_yt_dl_playlist 22'
alias ytp-best='general_yt_dl_playlist bestvideo+bestaudio'

# Youtube Music
alias yta-aac='general_audio_playlist aac'
alias yta-best='general_audio_playlist best'
alias yta-flac='general_audio_playlist flac'
alias yta-m4a='general_audio_playlist m4a'
alias yta-mp3='general_audio_playlist mp3'
alias yta-opus='general_audio_playlist opus'
alias yta-vorbis='general_audio_playlist vorbis'
alias yta-wav='general_audio_playlist wav'

#free
alias free='free --mega -h'

#add new fonts
alias update-fc='doas fc-cache -fv'
#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'
