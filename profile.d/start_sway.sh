#!/bin/sh
if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
  # Session
  export XDG_SESSION_TYPE=wayland
  export XDG_SESSION_DESKTOP=sway
  export XDG_CURRENT_DESKTOP=sway

  # Wayland stuff
  export QT_QPA_PLATFORM=wayland
  export QT_QPA_PLATFORMTHEME=qt5ct
  export ECORE_EVAS_ENGINE=wayland_egl
  export ELM_ENGINE=wayland_egl
  export SDL_VIDEODRIVER=wayland
  export _JAVA_AWT_WM_NONREPARENTING=1
  export MOZ_ENABLE_WAYLAND=1

  # sway-screenshot uses SWAY_SCREENSHOT_DIR for screenshot location. Set the variable
  export SWAY_SCREENSHOT_DIR="$HOME/Screenshots/"

  exec sway $@
fi
