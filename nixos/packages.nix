{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    helix
    home-manager
    tpm2-tools
  ];
}
