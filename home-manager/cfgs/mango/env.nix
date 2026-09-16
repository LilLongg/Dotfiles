{
  wayland.windowManager.mango.settings = {
    env = [
      "NIXOS_OZONE_WL,1"
      "ELECTRON_OZONE_PLATFORM_HINT,wayland"

      "GDK_BACKEND,wayland"
      "GDK_DEBUG,portals"

      "QT_QPA_PLATFORM,wayland"
      "QT_AUTO_SCREEN_SCALE_FACTOR,1"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"

      "SDL_VIDEODRIVER,wayland"
      "CLUTTER_BACKEND,wayland"
      "VDPAU_DRIVER,va_gl"
      "ANV_DEBUG,video-decode,video-encode"
    ];
  };
}
