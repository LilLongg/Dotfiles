{ pkgs, ... }: {
  programs.yazi = {
    plugins = {
      recycle-bin = {
        package = pkgs.yaziPlugins.recycle-bin;
        setup = true;
      };
    };
    keymap = {
      mgr.prepend_keymap = [
        {
          on = [
            "g"
            "t"
          ];
          run = "plugin recycle-bin";
          desc = "Open recycle-bin plugin";
        }
      ];
    };
  };
}
