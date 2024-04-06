# Use default merge message without confirmation:
$env.GIT_MERGE_AUTOEDIT = no

# Use VSCode as editor (uses VSCode Remote): https://stackoverflow.com/a/64644345/3720305
$env.EDITOR = "code -w $*"

# Fix symlinks: `ln -s` bash command to actually create symbolic links, rather than making a copy (Cygwin, why this isn't default?):
$env.MSYS = winsymlinks:nativestrict
