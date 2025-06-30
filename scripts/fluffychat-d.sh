#!/bin/sh
set -e

# latest_tag=`curl -s https://api.github.com/repos/krille-chan/fluffychat/releases/latest | jq -r '.tag_name'` # returns tag

latest_tag="v1.27.0" # above that and for some reason qtwebengine stops being able to load the page

URL="https://github.com/krille-chan/fluffychat/releases/download/$latest_tag/fluffychat-web.tar.gz"

/bin/wget "${URL}" -P "${BUILD_DIR}" # download it


if [ ! -f "${BUILD_DIR}/fluffychat-web.tar.gz" ]; then # sanity check fluffychat-d.sh worked
  echo "directory (${BUILD_DIR}/fluffychat-web.tar.gz) does not exist!!"
  exit 1
fi

/usr/bin/tar -xzf $BUILD_DIR/fluffychat-web.tar.gz -C $BUILD_DIR

/bin/cp $BUILD_DIR/build/web/index.html $BUILD_DIR/build/
/bin/cp $BUILD_DIR/build/web/auth.html $BUILD_DIR/build/

/bin/cp -r $BUILD_DIR/build/* $INSTALL_DIR

if [ ! -f "${INSTALL_DIR}/index.html" ]; then # sanity check tar extraction worked.
  echo "directory (${INSTALL_DIR}/index.html) does not exist!!"
  exit 1
fi

/bin/rm -rf ${BUILD_DIR}/fluffychat-web.tar.gz

if [ ! -f "${BUILD_DIR}/fluffychat-web.tar.gz" ]; then # sanity check rm -rf worked.
  echo "file (${BUILD_DIR}/fluffychat-web.tar.gz) exist!!"
fi

exit 0