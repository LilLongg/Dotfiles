{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "TTY";
      truecolor = false;
      theme_background = false;
      proc_sorting = "memory";
      disks_filter = "/";
    };
  };
}
