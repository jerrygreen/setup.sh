#/bin/bash
while true; do
  res=$($@)
  printf "\033c"
  echo "$res"
  echo "(last updated: $(date +\"%T\"))"
  sleep 5
done
