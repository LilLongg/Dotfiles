{ pkgs, ... }: {
  xdg.configFile."wlr-utils/config.toml".source = (pkgs.formats.toml { }).generate "config.toml" {
    theme = {
      name = "wallust";
      font = "Maple Mono NF CN";
      font-size = 12.0;
    };
    chooser = {
      switcher-size = 200;
    };
  };
}
