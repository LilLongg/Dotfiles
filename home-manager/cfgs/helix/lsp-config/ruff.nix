{
  programs.ruff = {
    enable = true;
    settings = {
      format = {
        docstring-code-format = true;
      };
      lint.isort = {
        length-sort = true;
        length-sort-straight = true;
        lines-after-imports = 2;
      };
    };
  };
}
