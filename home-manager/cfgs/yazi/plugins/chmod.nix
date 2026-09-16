{ pkgs, ... }: {
  programs.yazi = {
    plugins = {
      chmod = {
        package = pkgs.yaziPlugins.chmod;
      };
    };
    keymap = {
      mgr.prepend_keymap = [
        {
          on = [
            "c"
            "m"
          ];
          run = "plugin chmod";
          desc = "chmod on selected files";
        }
      ];
    };
  };
}
