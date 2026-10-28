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

    kdePackages.qtdeclarative
  ];

  programs.helix.languages.language-server = {
    nixfmt = {
      command = "nixfmt";
      args = [ "-" ];
    };
    qmlls = {
      command = "qmlls";
      args = [ "-E" ];
    };
    qmlformat = {
      command = "qmlformat";
      args = [ "%{buffer_name}" ];
    };
    ruff = {
      command = "ruff";
    };
  };
}
