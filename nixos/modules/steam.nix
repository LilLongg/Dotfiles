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
      enableWsi = true;
      capSysNice = false;
      args = [
        "--mangoapp"
        "--fullscreen"
        "--force-grab-cursor"
        "--adaptive-sync"
        "--hdr-enabled"
        "-F"
        "fsr"
      ];
      env = {
        PROTON_DXVK_LOWLATENCY = "1";
        PROTON_NO_WM_DECORATION = "1";
      };
    };
  };
}
