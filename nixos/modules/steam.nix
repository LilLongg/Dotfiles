{ pkgs, ... }: {
  programs = {
    steam = {
      enable = true;
      package = pkgs.steam.override {
        extraArgs = "-system-composer";
      };
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
    gamescope = {
      enable = true;
      capSysNice = false;
      args = [
        "--mangoapp"
        "--adaptive-sync"
        "--fullscreen"
      ];
      env = {
        ENABLE_GAMESCOPE_WSI = "1";
        PROTON_ENABLE_WAYLAND = "1";
        PROTON_DXVK_LOWLATENCY = "1";
        PROTON_NO_WM_DECORATION = "1";
        PROTON_USE_NTSYNC = "1";
        PROTON_USE_WINE3D = "1";
        WINE_NO_WM_DECORATION = "1";
      };
    };
  };
}
