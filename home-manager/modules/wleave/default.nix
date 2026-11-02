{
  programs.wleave = {
    enable = true;
    style = ./style.css;
  };

  imports = [
    ./config.nix
  ];
}
