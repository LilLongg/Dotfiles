{
  programs.floorp.enable = true;
  imports = [
    ./browser-on-ram.nix
    ./profile.nix
    ./extensions
  ];
}
