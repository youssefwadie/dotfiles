function zsh_add_file () {
		[[ -f "$1" ]] && source "$1"
}

function ranger_cd() {
    temp_file="$(mktemp -p '/tmp' 'ranger_cd.XXXXXXXXXX')"
    ranger --choosedir="$temp_file" -- "${@:-$PWD}"
    if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$PWD" ]; then
        cd -- "$chosen_dir"
    fi
    rm -f -- "$temp_file"
}

# search repos for programs that can't be found
function command_not_found_handler() {
  local pkgs cmd="$1"

  # pkgfile is faster than `pacman -F` in indexing the binary files
  pkgs=(${(f)"$(pkgfile -b -v -- "$cmd" 2>/dev/null)"})
  if [[ -n "$pkgs" ]]; then
    printf '%s may be found in the following packages:\n' "$cmd"
    printf '  %s\n' $pkgs[@]
  else
    printf 'zsh: command not found: %s\n' "$cmd"
  fi 1>&2

  return 127
}


#function command_not_found_handler() {
#  local pkgs cmd="$1"
#  pkgs=(${(f)"$(pacman -F --color always usr/bin/$cmd 2>/dev/null)"})
#
#  if [[ -n "$pkgs" ]]; then
#    printf '%s may be found in the following packages:\n' "$cmd"
#    printf '  %s\n' $pkgs[@]   
#  else
#    printf 'zsh: command not found: %s\n' "$cmd"
#  fi 1>&2
#  return 127
#}


