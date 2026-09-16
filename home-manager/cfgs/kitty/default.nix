{
  programs.kitty = {
    enable = true;
    font = {
      name = "Maple Mono NF CN";
      size = 12;
    };
    keybindings."ctrl+t" = "new_tab_with_cwd";
    settings = {
      include = "./colors.conf";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      mouse_hide_wait = 2.0;
      cursor_shape = "block";
      confirm_os_window_close = 0;
      allow_remote_control = "yes";
      input_delay = 0;
      repaint_delay = 8;
      sync_to_monitor = "no";
    };
    shellIntegration.enableFishIntegration = true;
  };
}
