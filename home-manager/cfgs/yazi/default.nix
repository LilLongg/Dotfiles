{
  imports = [
    ./config.nix
    ./theme.nix

    ./plugins
  ];
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };
}
