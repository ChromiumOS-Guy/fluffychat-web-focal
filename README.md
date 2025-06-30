# Fluffychat Web for Ubuntu Touch (Focal)

This repository contains the latest version of Fluffychat Web that is compatible with **Ubuntu Touch Focal (using QtWebEngine)**, packaged as a Click application.

## Overview

This specific build offers a functional **Fluffychat Web** experience on Ubuntu Touch devices running the Focal release. It is critical to understand that **newer versions of Fluffychat Web FAIL to run** on the QtWebEngine used in Ubuntu Touch Focal. Consequently, this package provides the **latest available release of Fluffychat Web** that manages to function within this environment.

## Known Limitations

While this version offers core functionality, please be aware of the following known issues:

* **File Sharing:** Any attempt to use file sharing functionality will trigger `url-dispatcher` to indicate that no supported applications are available for handling the share.

* **Video Playback:** Watching shared videos may exhibit some buggy behavior or inconsistencies.

* **File Downloads:** File downloads are supported, but the download path is fixed due to the application's confinement. All downloaded files will be saved to:
    `~/.local/share/fluffychat-web.chromiumos-guy/Downloads`


## License

Copyright (C) 2025  ChromiumOS-Guy

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License version 3, as published by the
Free Software Foundation.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranties of MERCHANTABILITY, SATISFACTORY
QUALITY, or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see <http://www.gnu.org/licenses/>.
