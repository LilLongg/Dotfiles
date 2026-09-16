{ pkgs, ... }: {
  xdg.configFile."fastfetch/config.jsonc".source = ./config.jsonc;
  xdg.configFile."fastfetch/smallfetch.jsonc".source = ./smallfetch.jsonc;
  xdg.configFile."fastfetch/cat.txt".source = ./cat.txt;
  home.packages = with pkgs; [ fastfetch ];
}
