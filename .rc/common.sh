# My default aliases:
alias projects="cd ~/projects"

# Use completions (feel free to add bash completions there, this folder has no permission errors across all platforms):
[[ -d ~/.completions && -n $(ls -A ~/.completions) ]] && . ~/.completions/*

# Bash history to be a good size:
HISTSIZE=1000000
HISTFILESIZE=1000000

# Use default merge message when merging:
export GIT_MERGE_AUTOEDIT=no

# TODO: probably remove functions?
function killport() {
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
