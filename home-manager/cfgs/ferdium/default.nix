{ pkgs, ... }: {
  xdg.configFile."Ferdium/config/settings.json".source = ./settings.json;
  home.packages = with pkgs; [
    ferdium
  ];
  imports = [ ./ferdium-on-ram.nix ];
}
