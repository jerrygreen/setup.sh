if [ "$1" = "--disable" ]; then
  sed -i "s/.*SETUP_SH_CHECKED_AT.*/SETUP_SH_CHECKED_AT=0/g" ~/.rc/X_VERSION_SETUP.SH
  echo "[setup.sh]: Update-notifier disabled! To enable it again, run setup as soon as you ready:"
  echo "curl -sL https://x.jerrygreen.me/setup.sh | bash"
else
  echo "To update setup.sh, run:"
  echo "curl -sL https://x.jerrygreen.me/setup.sh | bash"
fi
