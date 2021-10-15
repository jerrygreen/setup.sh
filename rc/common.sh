# Unify command prompt between platforms, showing: user@host folder [branch]
# export PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\]`$__git_ps1`\[\033[0m\]\n$ '
parse_git_branch() {
  git branch 2>/dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}
COLOR_DEF='%f'
COLOR_USR='%F{243}'
COLOR_DIR='%F{42}'
COLOR_GIT='%F{96}'
NEWLINE=$'\n'
PROMPT='${NEWLINE}${COLOR_USR}%n@%m ${COLOR_DIR}${PWD##*/} ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}$ '

# Use completions (feel free to add bash completions there, this folder has no permission errors across all platforms):
[[ -d ~/.completions && -n $(ls -A ~/.completions) ]] && . ~/.completions/*

# Bash history to be a good size:
export HISTSIZE=65536
export HISTFILESIZE=65536

# Use default merge message without confirmation:
export GIT_MERGE_AUTOEDIT=no

# Make custom functions available in bash
export PATH=$PATH:~/bin

# Enable Ctrl+S for fwd-i-search (in addition to existing Ctrl+R bck-i-search): https://stackoverflow.com/a/25391867/3720305
[[ $- == *i* ]] && stty -ixon

# function check() {
#   while true; do
#     res=$($@)
#     printf "\033c"
#     echo "$res"
#     echo "(last updated: $(date +\"%T\"))"
#     sleep 5
#   done
# }

# function setup_updater_disable() {
#   sed -i "s/.*SETUP_SH_CHECKED_AT.*/SETUP_SH_CHECKED_AT=0/g" ~/.rc/X_VERSION_SETUP.SH
#   echo "[setup.sh]: Update-notifier disabled! To enable it again, run setup as soon as you ready:"
#   echo "curl -sL https://x.jerrygreen.me/setup.sh | bash"
# }

# function check_setup() {
#   source ~/.rc/X_VERSION_SETUP.SH
#   if [[ "$SETUP_SH_CHECKED_AT" -gt 0 ]]; then
#     local CHECK_FREQ='79200' # every 22 hours
#     local NOTIF_FREQ='6092'  # roughly every 1.5 hours
#     local TIMESTAMP=$(date +%s)
#     local CHECK_DIFF=$(expr $TIMESTAMP - $SETUP_SH_CHECKED_AT)
#     local NOTIF_DIFF=$(expr $TIMESTAMP - $SETUP_SH_NOTIFED_AT)
#     if [[ $CHECK_DIFF -gt "$CHECK_FREQ" ]]; then
#       local NEW_COMMIT_COUNT=$(curl -s https://api.github.com/repos/jerrygreen/setup.sh/compare/master...$SETUP_SH_VERSION | grep behind_by | awk '{print $2}' | tr -cd '[[:digit:]]')
#       if [[ "$NEW_COMMIT_COUNT" -gt 0 ]]; then
#         SETUP_SH_UPD_AVAILB=1
#         sed -i "s/.*SETUP_SH_UPD_AVAILB.*/SETUP_SH_UPD_AVAILB=1/g" ~/.rc/X_VERSION_SETUP.SH
#       fi
#       sed -i "s/.*SETUP_SH_CHECKED_AT.*/SETUP_SH_CHECKED_AT=$TIMESTAMP/g" ~/.rc/X_VERSION_SETUP.SH
#     fi
#     if [[ "$SETUP_SH_UPD_AVAILB" -gt 0 && "$NOTIF_DIFF" -gt "$NOTIF_FREQ" ]]; then
#       echo -e "\r\033[K[setup.sh]: There is a new version available! To update, run:\ncurl -sL https://x.jerrygreen.me/setup.sh | bash"
#       sed -i "s/.*SETUP_SH_NOTIFED_AT.*/SETUP_SH_NOTIFED_AT=$TIMESTAMP/g" ~/.rc/X_VERSION_SETUP.SH
#     fi
#   fi
# }
# export -f check_setup
# function check_setup_async() {
#   if [[ "$1" = "--no-check" ]]; then return; fi
#   local TEMP_FILE=$(mktemp -t check-setup.sh-XXXX)
#   nohup bash -c "check_setup" &>$TEMP_FILE &
#   wait < <(jobs -p)
#   cat $TEMP_FILE
#   rm -rf $TEMP_FILE
#   kill -WINCH "$$" &>/dev/null
# }
# export -f check_setup_async
# check_setup_async $1 &
# disown
