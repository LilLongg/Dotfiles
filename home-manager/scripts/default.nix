{ config, ... }: {
  home.file."${config.xdg.binHome}/bgaction".source = ./bgaction;
  home.file."${config.xdg.binHome}/initbg".source = ./initbg;
  home.file."${config.xdg.binHome}/install-themes.sh".source = ./install-themes.sh;
  home.file."${config.xdg.binHome}/screenrec".source = ./screenrec;
  home.file."${config.xdg.binHome}/screenshot".source = ./screenshot;
  home.file."${config.xdg.binHome}/select-cliphist".source = ./select-cliphist;
  home.file."${config.xdg.binHome}/select-wpp".source = ./select-wpp;
  home.file."${config.xdg.binHome}/system-age".source = ./system-age;
  home.file."${config.xdg.binHome}/uptime-fmt".source = ./uptime-fmt;

  home.file."${config.xdg.userDirs.extraConfig.SCRIPTS}/image-theme.py".source = ./image-theme.py;
  home.file."${config.xdg.userDirs.extraConfig.SCRIPTS}/update-icons.py".source = ./update-icons.py;
}
