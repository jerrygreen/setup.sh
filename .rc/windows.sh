# Fixes
export PROMPT_COMMAND='history -a' # Fixes bug with history not filling up
export CYGWIN="winsymlinks:nativestrict" # makes Cygwin create actual Windows symlinks with `ln` command, rather than making a copy (Cygwin, why this isn't default?)
