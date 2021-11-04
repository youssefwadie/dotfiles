function youtube_dl_480p() {
	youtube-dl "$1" -f135+140 -o "~/Downloads/youtube-dl/%(title)s.%(ext)s" --write-sub --sub-lang en,ar
}


function general_yt_dl_video() {
	youtube-dl -f "$1" "$2" -o "~/Downloads/youtube-dl/%(title)s.%(ext)s" --write-sub --sub-lang en,ar --write-auto-sub
}

function general_yt_dl_playlist() {
	youtube-dl -f "$1" "$2" -o "~/Downloads/youtube-dl/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" --playlist-start "$3" --playlist-end "$4" --write-sub --sub-lang en --write-auto-sub
}

function general_audio_playlist() {
	youtube-dl "$2" --extract-audio --audio-format "$1" -o "~/Downloads/youtube-dl/%(title)s.%(ext)s"
}

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
