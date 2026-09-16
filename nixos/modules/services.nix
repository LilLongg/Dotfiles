{ pkgs, ... }: {
  programs.dconf.enable = true;
  gtk.iconCache.enable = true;
  security.polkit.enable = true;
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    journald.settings.Journal.Storage = "volatile";
    ananicy = {
      enable = true;
      package = pkgs.ananicy-cpp;
      rulesProvider = pkgs.ananicy-rules-cachyos;
    };
    auto-cpufreq.enable = true;
    tlp = {
      enable = true;
      settings = {
        TLP_DISABLE_DEFAULTS = 1;
        TLP_AUTO_SWITCH = 0;
        RESTORE_THRESHOLDS_ON_BAT = 1;
        START_CHARGE_THRESH_BAT1 = 0;
        STOP_CHARGE_THRESH_BAT1 = 60;
      };
    };
  };
}
