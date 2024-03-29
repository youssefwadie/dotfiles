# yt-dlp helper functions
function yt480() {
	yt-dlp -f135+140 -o "~/Downloads/YouTube/%(title)s.%(ext)s" --write-sub --sub-lang en,ar "$1"
}


function yt_video() {
	yt-dlp --no-playlist -f "$1" -o "~/Downloads/YouTube/%(title)s.%(ext)s" --write-sub --sub-lang en,ar --write-auto-sub "$2"
}

function yt_playlist() {
	yt-dlp -f "$1" -o "~/Downloads/YouTube/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" --playlist-start "$3" --playlist-end "$4" --write-sub --sub-lang en,ar --write-auto-sub "$2"
}

function yt_playlist_without_indices() {
	yt-dlp -f "$1" -o "~/Downloads/YouTube/%(playlist)s/%(title)s.%(ext)s" --playlist-start "$3" --playlist-end "$4" --write-sub --sub-lang en,ar --write-auto-sub "$2"
}

function yt_audio() {
	yt-dlp --extract-audio --audio-format "$1" -o "~/Downloads/YouTube/Music/%(creator)s/%(title)s.%(ext)s" "$2"
}

function continue_downloading() {
    if [[ $# -ne 1 ]]; then
        printf "Expected the one file for links, got %d\n" $#
    else
        aria2c --max-concurrent-downloads=1 --summary-interval=0 --check-certificate=false --auto-file-renaming=false --dir=$PWD --input=$1
    fi
}

# extract almost any archive
function ex() {
  if [[ $# -eq 1 ]] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1   ;;
      *.tar.gz)    tar xvzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xvf $1    ;;
      *.tbz2)      tar xvjf $1   ;;
      *.tgz)       tar xvzf $1   ;;
      *.zip)       unzip $1 -d "${1%.*}"     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           printf "'%s' cannot be extracted via ex()\n" $1 ;;
    esac
  else
		printf "Expected the one file, got %d\n" $#
  fi
}
