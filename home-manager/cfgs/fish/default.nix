{
  programs.fish.enable = true;
  xdg.configFile."fish/functions" = {
    source = ./functions;
    recursive = true;
  };

  imports = [
    ./integration.nix
    ./interactive.nix
  ];
}
