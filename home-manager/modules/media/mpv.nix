{ pkgs, ... }: {
  programs.mpvpaper.enable = true;
  programs.mpv = {
    enable = true;
    scripts = with pkgs; [ mpvScripts.mpris ];
    config = {
      profile = "high-quality";
      vo = "gpu-next";
      hwdec = "auto";
      hwdec-codecs = "full";
      osd-bar = false;
    };
  };
}
