#!/bin/sh

SCREENCAPTURE_CMD='unknown'

if test "$(uname)" = 'Linux'; then
  SCREENCAPTURE_CMD='import -window root'
elif test "$(uname)" = 'Darwin'; then
  SCREENCAPTURE_CMD='screencapture -t png -x'
else
  echo "This script doesn't support your OS type"
  exit 1
fi

# screen captures
while [ 1 ]; do
  if xscreensaver-command -time | grep --quiet "screen blanked"; then
    sleep 10
  else
    $SCREENCAPTURE_CMD ./images/`date +%s`.png
    echo "captured `date +%s`"
    sleep 1
  fi
done
