# Fix History: so it filling up (How this even a bug?):
export PROMPT_COMMAND='history -a'

# Fix Symlinks: `ln -s` bash command to actually create symbolic links, rather than making a copy (Cygwin, why this isn't default?):
export MSYS=winsymlinks:nativestrict
