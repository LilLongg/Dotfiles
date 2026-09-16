{
  xdg.configFile."vesktop/settings/settings.json".source = ./settings.json;
  programs.vesktop = {
    enable = true;
    settings = {
      arRPC = true;
      autoStartMinimized = false;
      clickTrayToShowHide = true;
      disableSmoothScroll = false;
      hardwareAcceleration = true;
      hardwareVideoAcceleration = true;
      minimizeToTray = true;
      tray = true;
    };
  };
  imports = [ ./vesktop-on-ram.nix ];
}
