{ pkgs, ... }: {
  xdg.configFile."mpris-notifier/config.toml".source =
    (pkgs.formats.toml { }).generate "config.toml"
      {
        subject_format = "Playerctl";
        body_format = "Playing: <b>{title}</b>\nBy <b>{artist}</b>\nFrom <i>{album}</i>";
        join_string = ", ";
        enable_album_art = true;
        album_art_deadline = 1000;
        urgency = 0;
      };
}
