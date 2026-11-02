{
  programs.helix.settings = {
    theme = "wallust";

    editor = {
      line-number = "relative";
      preview-completion-insert = false;
      end-of-line-diagnostics = "warning";
      color-modes = true;
      bufferline = "always";
      auto-format = true;
      soft-wrap.enable = true;
      cursor-shape.insert = "bar";
      file-picker.hidden = false;
      whitespace.render.newline = "all";
      indent-guides.render = true;
    };

    keys = {
      normal = {
        esc = [
          "collapse_selection"
          "keep_primary_selection"
        ];
        C-j = [
          "extend_to_line_bounds"
          "delete_selection"
          "paste_after"
        ];
        C-k = [
          "extend_to_line_bounds"
          "delete_selection"
          "move_line_up"
          "paste_before"
        ];
      };
      insert = {
        C-c = "toggle_comments";
        esc = [
          "normal_mode"
          ":sh fcitx5-remote -g Default"
        ];
      };
      select = {
        esc = [
          "normal_mode"
          "collapse_selection"
          "keep_primary_selection"
        ];
        C-j = [
          "extend_to_line_bounds"
          "delete_selection"
          "paste_after"
        ];
        C-k = [
          "extend_to_line_bounds"
          "delete_selection"
          "move_line_up"
          "paste_before"
        ];
      };
    };
  };
}
