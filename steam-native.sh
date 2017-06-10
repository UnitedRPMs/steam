#!/bin/sh

# Improved interactions between the Steam runtime and host distribution
# libraries, which should let Steam work out of the box with open-source
# graphics drivers on modern distributions. If using an older distribution or
# running into problems, set variable at 0 to revert to the previous behavior.
# STEAM_RUNTIME_PREFER_HOST_LIBRARIES=0

# Unify close-to-tray behavior with other platforms. If using a distribution
# that doesn't have proper compatible tray support set variable at 0.
export STEAM_FRAME_FORCE_CLOSE=1

export STEAM_RUNTIME=1
# Workaround for dbus fatal termination related coredumps (SIGABRT)
# https://github.com/ValveSoftware/steam-for-linux/issues/4464
export DBUS_FATAL_WARNINGS=0
# Override some libraries as these are what games linked against.
export LD_LIBRARY_PATH="/usr/lib/steam:/usr/lib32/steam"
exec /usr/lib/steam/steam "$@"
