# Use completions (feel free to add bash completions there, this folder has no permission errors across all platforms):
[[ -d ~/.completions && -n $(ls -A ~/.completions) ]] && . ~/.completions/*

# Bash history to be a good size:
HISTSIZE=65536
HISTFILESIZE=65536

# Use default merge message without confirmation:
export GIT_MERGE_AUTOEDIT=no

# Enable Ctrl+S for fwd-i-search (in addition to existing Ctrl+R bck-i-search): https://stackoverflow.com/a/25391867/3720305
# [[ $- == *i* ]] && stty -ixon
[[ -o interactive ]] && stty -ixon

# Just a couple cool functions
function killport() {
  # usage: killport 3000
  kill -9 $(lsof -t -i:$1)
}
function check() {
  while true; do
    res=$($@)
    printf "\033c"
    echo "$res"
    echo "(last updated: $(date +\"%T\"))"
    sleep 5
  done
}
