REPO=https://github.com/JerryGreen/setup.sh
RAW_REPO=https://raw.github.com/JerryGreen/setup.sh/master
VERSION_SHORT="0.1"
VERSION_PREV="e7cf42d5e667b3171be876c8b6c35ffd930cb55f"
MSG="### Automatically generated file. Instead of editing, add changes to either ~/.bashrc, or into repository:\n### $REPO\n"

# Initial Check

source ~/.rc/X_VERSION_SETUP.SH 2>/dev/null
set -e
if [ -z "$SETUP_SH_VERSION" ]; then
  ACTION="Setting up"
else
  ACTION="Updating"
fi

case "$OSTYPE" in
linux-gnu*)
  echo "[setup.sh] Warning: Linux is not really supported! Feel free to adapt the script:"
  echo $REPO
  echo
  echo "[setup.sh] $ACTION 'linux' bash environment..."
  ;;
darwin*)
  echo "[setup.sh] $ACTION 'macos' bash environment..."
  ;;
msys*)
  echo "[setup.sh] $ACTION 'windows' bash environment..."
  ;;
esac

# Common Pre-Installation

mkdir -p ~/.rc
if [ -f ~/.bashrc ]; then
  RC_FILE=~/.bashrc
elif [ -f ~/.zshrc ]; then
  RC_FILE=~/.zshrc
elif [ command -v zsh 2>/dev/null && echo $? ]; then
  touch ~/.zshrc
  RC_FILE=~/.zshrc
elif [ command -v bash 2>/dev/null && echo $? ]; then
  touch ~/.bashrc
  RC_FILE=~/.bashrc
else
  echo "[setup.sh] Error: Neither zsh or bash were found (how did that come up?), exiting..." >&2
  exit 1
fi

TEMP_DIR=$(mktemp -dt setup.sh-XXXXXX)
git clone --quiet $REPO $TEMP_DIR >/dev/null
VERSION_PATCH=$(cd $TEMP_DIR && git rev-list --branches --count $VER_PREV..HEAD)
VERSION_FULL=$VERSION_SHORT.$VERSION_PATCH
SETUP_SH_RECENT_VERSION=$(cd $TEMP_DIR && git rev-parse HEAD)
TIMESTAMP=$(date +%s)
if [ -z "${SETUP_SH_VERSION}" ]; then
  SETUP_SH_VERSION=$SETUP_SH_RECENT_VERSION
  SETUP_SH_UPDATED_AT=$TIMESTAMP
  SETUP_SH_CHECKED_AT=$TIMESTAMP
  SETUP_SH_NOTIFED_AT=$TIMESTAMP
  SETUP_SH_UPD_AVAILB=0
  END_MESSAGE="Setup complete! (version $VERSION_FULL)"
else
  UPDATE_COUNT=$(cd $TEMP_DIR && git rev-list --branches --count HEAD..$SETUP_SH_VERSION 2>/dev/null) || true
  if [[ -n "${UPDATE_COUNT:=?}" && "$UPDATE_COUNT" != "0" ]]; then
    SETUP_SH_UPDATED_AT=$TIMESTAMP
    SETUP_SH_UPD_AVAILB=$TIMESTAMP
    END_MESSAGE="The recent version had \"${UPDATE_COUNT}\" new commits.\nNow updated! (version $VERSION_FULL)"
  else
    echo "[setup.sh] Nothing to update! (version $VERSION_FULL)"
    exit 0
  fi
fi
echo -e "# Automatically generated file, do not change\n
SETUP_SH_VERSION=$SETUP_SH_RECENT_VERSION
SETUP_SH_UPDATED_AT=$TIMESTAMP
SETUP_SH_CHECKED_AT=$TIMESTAMP
SETUP_SH_NOTIFED_AT=$TIMESTAMP
SETUP_SH_UPD_AVAILB=0
" >~/.rc/X_VERSION_SETUP.SH
cat <(echo -e $MSG) <(cd $TEMP_DIR && cat rc/common.sh) >~/.rc/common.sh

# OS-specific Pre-Installation

case "$OSTYPE" in
linux-gnu*)
  cat <(echo -e $MSG) <(cd $TEMP_DIR && cat rc/linux.sh) >~/.rc/linux.sh
  ;;
darwin*)
  cat <(echo -e $MSG) <(cd $TEMP_DIR && cat rc/macos.sh) >~/.rc/macos.sh
  ;;
msys*)
  cat <(echo -e $MSG) <(cd $TEMP_DIR && cat rc/windows.sh) >~/.rc/windows.sh
  ;;
esac

# Common Post-Installation

mkdir -p ~/.completions
cd $TEMP_DIR && {
  source <(cat rc-once/*)
  # TODO: aliases!
  # cd bin && {
  #   # rename '.sh' '' *.sh
  # }
}
mkdir -p ~/bin
cp -rf $TEMP_DIR/bin/* ~/bin/
COMMAND='[[ -d ~/.rc && -n $(ls -A ~/.rc) ]] && . <(cat ~/.rc/*)'
if [[ -z $(cat $RC_FILE | grep -F "$COMMAND") ]]; then
  echo "$COMMAND" >>$RC_FILE
fi

# .netrc

# TODO:
# Setup .netrc
# cat <<EOF
# machine   raw.githubusercontent.com
# login     $GITHUB_KEY
# password  x-oauth-basic

# machine   api.github.com
# login     $GITHUB_KEY
# password  x-oauth-basic

# EOF

rm -rf $TEMP_DIR
source $RC_FILE --no-check
echo -e "[setup.sh] $END_MESSAGE"
