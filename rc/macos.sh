# Fix shell: disable writing duplicate commands and commands starting with space, into history:
setopt HIST_IGNORE_ALL_DUPS # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS    # Do not display a line previously found.
setopt HIST_IGNORE_SPACE    # Don't record an entry starting with a space.

# Fix "Dock" menu: disable bouncing (which is annoying):
defaults write com.apple.dock no-bouncing -bool TRUE

# Fix git auto-completions:
autoload -Uz compinit && compinit

# Setup custom command prompt: user@host current_folder (branch)
print_git_branch() {
  git branch 2>/dev/null | sed -n -e 's/^\* \(.*\)/(\1)/p'
}
COLOR_DEF='%f'
COLOR_USR='%F{243}'
COLOR_DIR='%F{42}'
COLOR_GIT='%F{96}'
NEWLINE=$'\n'
PROMPT='${NEWLINE}${COLOR_USR}%n@%m ${COLOR_DIR}${PWD##*/} ${COLOR_GIT}$(print_git_branch)${COLOR_DEF}${NEWLINE}$ '
setopt PROMPT_SUBST
