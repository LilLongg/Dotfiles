{
  programs.helix.languages = {
    language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "nixfmt";
      }
      {
        name = "c";
        auto-format = true;
      }
      {
        name = "cpp";
        auto-format = true;
        language-servers = [
          "clangd"
          "hx-lsp"
        ];
      }
      {
        name = "python";
        auto-format = true;
        language-servers = [
          "ty"
          "ruff"
        ];
      }
      {
        name = "json";
        comment-token = "//";
        auto-format = true;
        formatter = {
          command = "prettier";
          args = [
            "--parser"
            "json"
          ];
        };
      }
      {
        name = "jsonc";
        comment-token = "//";
        auto-format = true;
        formatter = {
          command = "prettier";
          args = [
            "--parser"
            "jsonc"
          ];
        };
      }
      {
        name = "css";
        auto-format = true;
        formatter = {
          command = "prettier";
          args = [
            "--parser"
            "css"
          ];
        };
      }
      {
        name = "scss";
        auto-format = true;
        formatter = {
          command = "prettier";
          args = [
            "--parser"
            "scss"
          ];
        };
      }
    ];
  };
}
