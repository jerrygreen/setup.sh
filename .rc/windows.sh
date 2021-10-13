# Fix History: so it's filling up during crashes (how this even a bug?): https://github.com/microsoft/vscode/issues/85831
export PROMPT_COMMAND='history -a'

# Fix Symlinks: `ln -s` bash command to actually create symbolic links, rather than making a copy (Cygwin, why this isn't default?):
export MSYS=winsymlinks:nativestrict

# Do not write duplicate commands, and commands starting with space, into history:
export HISTCONTROL=erasedups:ignorespace:ignoredups
