{
  imports = [
    ./autostart.nix
    ./general.nix
    ./keybinds.nix
    ./layouts.nix
    ./rules.nix
  ];
  wayland.windowManager.mango = {
    enable = true;
    systemd.enable = true;
    topPrefixes = [
      "source"
      "source-optional"
    ];
    settings.source-optional = [
      "./theme.conf"
      "./dropin.conf"
    ];
  };
}
