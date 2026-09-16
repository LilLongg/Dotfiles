{ pkgs, ... }: {
  home.packages = with pkgs; [
    noto-fonts-color-emoji
    maple-mono.NF-CN
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = [ "Noto Color Emoji" ];
      monospace = [ "Maple Mono NF CN" ];
      serif = [ "Maple Mono NF CN Italic" ];
      sansSerif = [ "Maple Mono NF CN" ];
    };
  };
}
