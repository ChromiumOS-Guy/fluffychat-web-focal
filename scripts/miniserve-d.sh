#!/bin/sh
set -e

case $ARCH in # make sure its the format i want while logging
  aarch64|arm64) echo -e "aarch64 architecture detected\n" && ARCH="aarch64";;
  amd64|x86_64) echo -e "amd64/x86_64 architecture detected\n" && ARCH="x86_64" ;;
  *) echo "Error: Unknown architecture ${ARCH}" && exit 1 ;;
esac

latest_tag=`curl -s https://api.github.com/repos/svenstaro/miniserve/releases/latest | jq -r '.tag_name'` # returns tag
latest_tag_without_v=$(echo "$latest_tag" | sed 's/^v//')

URL="https://github.com/svenstaro/miniserve/releases/download/$latest_tag/miniserve-$latest_tag_without_v-$ARCH-unknown-linux-gnu"

/bin/wget "${URL}" -P "${INSTALL_DIR}" # download it


if [ ! -f "${INSTALL_DIR}/miniserve-$latest_tag_without_v-$ARCH-unknown-linux-gnu" ]; then # sanity check fluffychat-d.sh worked
  echo "directory (${INSTALL_DIR}/miniserve-$latest_tag_without_v-$ARCH-unknown-linux-gnu) does not exist!!"
  exit 1
fi

/bin/chmod +x "${INSTALL_DIR}/miniserve-$latest_tag_without_v-$ARCH-unknown-linux-gnu"

exit 0