{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bibata-cursors
    git
    helix
    home-manager
    tpm2-tools
  ];
}
