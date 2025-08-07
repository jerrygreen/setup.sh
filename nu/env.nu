# Use default merge message without confirmation:
$env.GIT_MERGE_AUTOEDIT = "no"

# Use VSCode as editor (uses VSCode Remote): https://stackoverflow.com/a/64644345/3720305
$env.EDITOR = "code -w $*"

# Fix symlinks: `ln -s` bash command to actually create symbolic links, rather than making a copy (Cygwin, why this isn't default?):
$env.MSYS = "winsymlinks:nativestrict"

# More about history isolation in nushell: https://github.com/nushell/nushell/issues/10104
$env.config.history.file_format = "sqlite"
$env.config.history.isolation = true

# How that even broken on macos, nushell? (Monterey 2.7.4)
# $env.Path = ($env.Path | prepend '/usr/local/bin')

# Remove the timestamp that only breaks copy-pasting
$env.PROMPT_COMMAND_RIGHT = ""
$env.config.render_right_prompt_on_last_line = false

# Auto-completions
#$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
#mkdir ~/.cache/carapace
#carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
