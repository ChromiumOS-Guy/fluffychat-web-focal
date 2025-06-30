#!/bin/sh

## fail codes
FAIL_DOWNLAOD=3
FAIL_MOVING=2


## export
export ARCH=${ARCH_TRIPLET%%-*}


# logging
LOG_FILE=${BUILD_DIR}`/bin/date +"%Y-%m-%d_%H-%M-%S"`_build.log
echo "--->logging at " + `/bin/date +"%Y-%m-%d_%H-%M-%S"` >> $LOG_FILE


## file managment
echo "--->managing files" >> $LOG_FILE
/bin/cp $ROOT/* $BUILD_DIR 2>/dev/null >> $LOG_FILE
/bin/cp $BUILD_DIR/* $INSTALL_DIR 2>/dev/null >> $LOG_FILE # copying leftovers
/bin/chmod +x $INSTALL_DIR/launch.sh # make it ultra clear that this is an executable.


## scripts
echo "--->copying scripts" >> $LOG_FILE
/bin/cp -r ${ROOT}/scripts $BUILD_DIR

if [ ! -d "$BUILD_DIR/scripts" ]; then # sanity check cp worked
  echo "directory ($BUILD_DIR/script) does not exist!, failed to copy build scripts" >> $LOG_FILE
  exit 1
fi


# fluffychat script downloader
echo "--->running fluffychat download script" >> $LOG_FILE
if ! $BUILD_DIR/scripts/fluffychat-d.sh >> $LOG_FILE; then # move app files to build
  echo "Error: fluffychat download script failed with exit code $?" >> $LOG_FILE
  exit $FAIL_DOWNLAOD
else
  echo "Successfully downloaded fluffychat scripts!" >> $LOG_FILE
fi


# miniserve script downloader
echo "--->running miniserve download script" >> $LOG_FILE
if ! $BUILD_DIR/scripts/miniserve-d.sh >> $LOG_FILE; then # move app files to build
  echo "Error: miniserve download script failed with exit code $?" >> $LOG_FILE
  exit $FAIL_DOWNLAOD
else
  echo "Successfully downloaded miniserve scripts!" >> $LOG_FILE
fi

exit 0