{ pkgs, ... }: {
  home.packages = with pkgs; [
    bluetui
    impala
  ];
  imports = [ ./config.nix ];
}
