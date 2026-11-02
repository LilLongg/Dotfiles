{ pkgs, ... }: {
  programs.yazi = {
    plugins = {
      git = {
        package = pkgs.yaziPlugins.git;
        setup = true;
        settings = {
          order = 1500;
        };
      };
    };
    settings = {
      plugin.prepend_fetchers = [
        {
          url = "*";
          run = "git";
          group = "git";
        }
        {
          url = "*/";
          run = "git";
          group = "git";
        }
      ];
    };
  };
}
