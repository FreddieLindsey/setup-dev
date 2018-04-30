#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

FILES=("limit.maxfiles.plist" "limit.maxproc.plist")

for file in ${FILES[@]}; do
  sudo mv ${DIR}/../files/${file} /Library/LaunchDaemons/
  sudo chown root:wheel /Library/LaunchDaemons/${file}
  sudo chmod 0644 /Library/LaunchDaemons/${file}
  sudo launchctl load -w /Library/LaunchDaemons/${file}
done
