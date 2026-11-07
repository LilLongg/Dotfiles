{ pkgs, ... }:
let
  config = (pkgs.formats.toml { }).generate "config.toml" {
    theme = {
      background = "red";
      border = "red";
      text_color = "white";
      hidden_color = "cyan";
      info_color = "cyan";
      warning_color = "cyan";
      error_color = "red";
    };
  };
in
{
  xdg.configFile."bluetui/config.toml".source = config;
  xdg.configFile."impala/config.toml".source = config;
}
