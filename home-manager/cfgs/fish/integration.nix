{
  home.shell.enableFishIntegration = true;
  programs.lsd = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      sorting = {
        dir-grouping = "first";
      };
    };
  };
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}
