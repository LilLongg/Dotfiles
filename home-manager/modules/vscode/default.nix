{
  programs.vscode.enable = true;
  programs.vscode.mutableExtensionsDir = true;
  imports = [ ./vscode-on-ram.nix ];
}
