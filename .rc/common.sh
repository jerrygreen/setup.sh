# Aliases
alias projects="cd ~/projects"

# Completions (feel free to add bash completions there, this folder has no permission errors across all platforms)
[[ -d ~/.completions && -n $(ls -A ~/.completions) ]] && . ~/.completions/*

# Bash history to be a good size
HISTSIZE=1000000
HISTFILESIZE=1000000
