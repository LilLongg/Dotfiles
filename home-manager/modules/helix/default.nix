{
  programs.helix = {
    enable = true;
    defaultEditor = true;
  };

  imports = [
    ./languages.nix
    ./language-servers.nix
    ./settings.nix

    ./lsp-config
  ];
}
