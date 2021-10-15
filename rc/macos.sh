# Fix shell: disable writing duplicate commands and commands starting with space, into history:
setopt HIST_IGNORE_ALL_DUPS # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS    # Do not display a line previously found.
setopt HIST_IGNORE_SPACE    # Don't record an entry starting with a space.

# Fix "Dock" menu: disable bouncing (which is annoying):
defaults write com.apple.dock no-bouncing -bool TRUE

# Fix git auto-completions:
autoload -Uz compinit && compinit

# Enable special syntax & colors for command prompt
setopt PROMPT_SUBST
