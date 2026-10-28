{ pkgs, ... }: {
  home.packages = with pkgs; [
    clang-tools
    fish-lsp
    nixd
    nixfmt
    prettier
    tinymist
    typst
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
