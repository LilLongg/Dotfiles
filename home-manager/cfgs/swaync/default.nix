{
  services.swaync = {
    enable = true;
    style = ./style.css;
  };

  imports = [ ./config.nix ];
}
