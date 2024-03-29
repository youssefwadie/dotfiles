alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# switch graphic cards
alias tointel='optimus-manager --switch integrated'
alias tonvidia='optimus-manager --switch nvidia'
alias tohybrid='optimus-manager --switch hybrid'

# fix obvious typo's
alias cd..='cd ..'
alias daos='doas'

# get the error messages from journalctl
alias jctl='journalctl -p 3 -xb'

# maintenance
alias big='expac -H M "%m\t%n" | sort -h | nl'

# Neovim
alias v='nvim'

# Micro
alias m='micro'


# switch between bash and zsh
# alias tobash="doas chsh $USER -s /bin/bash && echo 'Now log out.'"
# alias tozsh="doas chsh $USER -s /bin/zsh && echo 'Now log out.'"

# Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

# pacman
alias p='pacman'
alias i='doas pacman -Syu'
alias r='doas pacman -Rsn'
alias u='doas pacman -Syu && paru -Sua'
alias idep='doas pacman -Syu && doas pacman -S --asdeps'
alias q='paru -Ss'
alias unlock="doas rm /var/lib/pacman/db.lck"
alias cleanup='pacman -Qtdq | doas pacman -Rsn -'
alias mirrors='doas reflector --latest 10 --protocol http,https --sort rate --download-timeout 20 --save /etc/pacman.d/mirrorlist'

# list
alias l='ls --color=auto'
alias ls='ls -lh --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias l.="ls -A | egrep '^\.'"

# file manipulation
alias mv='mv -vi'
alias cp='cp -vir'
alias rm='rm -vi'

# Colorize the grep command output for ease of use (good for log files)##
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# Youtube Video
alias ytv-best='yt_video bestvideo+bestaudio'
alias ytv-hd='yt_video 22'
alias ytv-480='yt480'

# Youtube Playlist
alias ytp-best='yt_playlist best'
alias ytp-hd='yt_playlist 22'
alias ytp-hd-wi='yt_playlist_without_indices 22'
alias ytp-best='yt_playlist bestvideo+bestaudio'

# Youtube Music
alias yta-aac='yt_audio aac'
alias yta-best='yt_audio best'
alias yta-flac='yt_audio flac'
alias yta-m4a='yt_audio m4a'
alias yta-mp3='yt_audio mp3'
alias yta-opus='yt_audio opus'
alias yta-vorbis='yt_audio vorbis'
alias yta-wav='yt_audio wav'

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

# clean history
# alias 'clear_history'="echo -n >| $HISTFILE; fc -p $HISTFILE; echo >&2 History file deleted."

# JS liver server
alias live-server='live-server --browser=/usr/bin/chromium'
