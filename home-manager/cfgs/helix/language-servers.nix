{ pkgs, ... }: {
  home.packages = with pkgs; [
    fish-lsp
    nixd
    nixfmt
    prettier
    vscode-css-languageserver
    vscode-json-languageserver
  ];

  programs.helix.languages.language-server = {
    nixfmt = {
      command = "nixfmt";
      args = [ "-" ];
    };
    ruff = {
      command = "ruff";
    };
  };
}
