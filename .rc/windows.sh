# Fixes bug with history not filling up:
export PROMPT_COMMAND='history -a'

# Makes Cygwin create actual Windows symlinks with `ln` command, rather than making a copy (Cygwin, why this isn't default?):
export CYGWIN=winsymlinks:nativestrict
export MSYS=winsymlinks:nativestrict
