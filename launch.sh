#!/bin/bash
set -e

# Start the miniserve HTTP server in the background.
# The '&' sends the process to the background, allowing the script to continue.
./miniserve-0.31.0-aarch64-unknown-linux-gnu . -p 64934 --disable-indexing &

# Set a 'trap' to kill the miniserve server process when this script exits,
# regardless of whether it exits normally or due to an error.
# This ensures the server doesn't keep running indefinitely.
trap "pkill miniserve" EXIT

# Launch webapp-container.
# "$@" expands to all positional parameters passed to this script,
# ensuring they are forwarded to webapp-container.
webapp-container --app-id="fluffychat-web.chromiumos-guy" \
                 --store-session-cookies \
                 --webapp-name="Fluffychat Web" \
                 --enable-media-hub-audio \
                 127.0.0.1:64934/index.html \
                 "$@"

# The 'trap' command ensures that even if webapp-container exits,
# the miniserve server will be killed.