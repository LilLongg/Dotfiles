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
      {
        name = "qml";
        auto-format = true;
        language-servers = [
          "qmlls"
        ];
      }
      {
        name = "typst";
        auto-format = true;
      }
    ];
  };
}
