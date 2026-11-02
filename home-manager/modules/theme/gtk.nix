{ pkgs, ... }: {
  gtk = {
    enable = true;
    theme.name = "adw-gtk3";
    gtk4.theme.name = "adw-gtk3";
    iconTheme.name = "Papirus";
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    font = {
      name = "Maple Mono NF CN";
      size = 12;
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        gtk-theme = "adw-gtk3";
        icon-theme = "Papirus";
        cursor-theme = "Bibata-Modern-Ice";
        cursor-size = 24;
      };
    };
  };

  home = {
    pointerCursor = {
      enable = true;
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
      x11 = {
        enable = true;
        defaultCursor = true;
      };
    };
  };
}
