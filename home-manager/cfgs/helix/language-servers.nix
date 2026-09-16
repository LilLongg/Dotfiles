{ pkgs, ... }: {
  home.packages = with pkgs; [
    clang-tools
    fish-lsp
    nixd
    nixfmt
    prettier
    vscode-css-languageserver
    vscode-json-languageserver
  ];

  programs.helix.languages.language-server = {
    hx-lsp = {
      command = "${pkgs.hx-lsp}/bin/hx-lsp";
    };
    ruff = {
      command = "ruff";
    };
  };
}
