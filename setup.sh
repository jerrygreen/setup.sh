REPO=https://github.com/JerryGreen/setup.sh
RAW_REPO=https://raw.github.com/JerryGreen/setup.sh/master
MSG="### Automatically generated file. Instead of editing, add changes to either ~/.bashrc, or into repository:\n### $REPO\n"

# Initial Check

case "$OSTYPE" in
linux-gnu*)
  echo "Warning: Linux is not really supported! Feel free to adapt the script:"
  echo $REPO
  echo
  echo "Setting up 'linux' bash environment..."
  ;;
darwin*)
  echo "Setting up 'macos' bash environment..."
  ;;
msys*)
  echo "Setting up 'windows' bash environment..."
  ;;
esac

# Common Pre-Installation

mkdir -p ~/.rc
if [ ! -f ~/.bashrc ]; then
  echo "There's no '~/.bashrc' file (how did that come up?), exiting..." >&2
  exit 1
fi
COMMAND='[[ -d ~/.rc && -n $(ls -A ~/.rc) ]] && . <(cat ~/.rc/*)'
if [[ -z $(cat ~/.bashrc | grep -F "$COMMAND") ]]; then
  echo "$COMMAND" >>~/.bashrc
fi
cat <(echo -e $MSG) <(curl -sL $RAW_REPO/.rc/common.sh) >~/.rc/common.sh

# OS-specific Pre-Installation
case "$OSTYPE" in
linux-gnu*) ;;
darwin*)
  cat <(echo -e $MSG) <(curl -sL $RAW_REPO/.rc/macos.sh) >~/.rc/macos.sh
  ;;
msys*)
  cat <(echo -e $MSG) <(curl -sL $RAW_REPO/.rc/windows.sh) >~/.rc/windows.sh
  ;;
esac

# Common Post-Installation

mkdir -p ~/.completions

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

source ~/.bashrc
echo "Setup complete!"
