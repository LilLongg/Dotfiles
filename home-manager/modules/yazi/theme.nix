{
  programs.yazi.theme = {
    mgr = {
      cwd = {
        fg = "cyan";
      };
      find_keyword = {
        bold = true;
        fg = "yellow";
      };
      find_position = {
        fg = "magenta";
      };
      marker_copied = {
        fg = "green";
        bg = "green";
      };
      marker_cut = {
        fg = "red";
        bg = "red";
      };
      marker_selected = {
        fg = "yellow";
        bg = "yellow";
      };
      count_copied = {
        fg = "black";
        bg = "green";
      };
      count_cut = {
        fg = "black";
        bg = "red";
      };
      count_selected = {
        fg = "black";
        bg = "yellow";
      };
      border_style = {
        fg = "blue";
      };
    };
    tabs = {
      active = {
        fg = "black";
        bg = "blue";
      };
      inactive = {
        fg = "blue";
        bg = "black";
      };
    };
    indicator = {
      parent = {
        reversed = true;
      };
      current = {
        reversed = true;
      };
      preview = {
        underline = true;
      };
    };
    mode = {
      normal_main = {
        fg = "black";
        bg = "blue";
        bold = true;
      };
      normal_alt = {
        fg = "blue";
        bg = "black";
      };
      selected_main = {
        fg = "black";
        bg = "magenta";
        bold = true;
      };
      selected_alt = {
        fg = "magenta";
        bg = "black";
      };
      unset_main = {
        fg = "black";
        bg = "red";
        bold = true;
      };
      unset_alt = {
        fg = "red";
        bg = "black";
      };
    };
    status = {
      perm_exec = {
        fg = "green";
      };
      perm_read = {
        fg = "yellow";
      };
      perm_sep = {
        fg = "cyan";
      };
      perm_type = {
        fg = "blue";
      };
      perm_write = {
        fg = "red";
      };
      progress_error = {
        fg = "red";
        bg = "black";
      };
      progress_label = {
        fg = "gray";
        bg = "black";
      };
      progress_normal = {
        fg = "gray";
        bg = "black";
      };
    };
    pick = {
      active = {
        fg = "magenta";
      };
      border = {
        fg = "blue";
      };
      inactive = {
        fg = "gray";
      };
    };
    task = {
      title = {
        fg = "blue";
      };
      border = {
        fg = "blue";
      };
      hovered = {
        fg = "gray";
        bg = "darkgray";
      };
    };
    input = {
      border = {
        fg = "blue";
      };
      hovered = {
        bg = "darkgray";
      };
    };
    help = {
      desc = {
        fg = "gray";
      };
      on = {
        fg = "cyan";
      };
      run = {
        fg = "magenta";
      };
      hovered = {
        bold = true;
        reversed = true;
      };
      footer = {
        fg = "gray";
        bg = "black";
      };
    };
    which = {
      mask = {
        bg = "black";
      };
      desc = {
        fg = "gray";
      };
      cand = {
        fg = "cyan";
      };
      rest = {
        fg = "blue";
      };
      separator_style = {
        fg = "darkgray";
      };
    };
    notify = {
      title_info = {
        fg = "cyan";
      };
      title_warn = {
        fg = "yellow";
      };
      title_error = {
        fg = "red";
      };
    };
    filetype = {
      rules = [
        {
          mime = "image/*";
          fg = "cyan";
        }
        {
          mime = "{audio,video}/*";
          fg = "yellow";
        }
        {
          mime = "application/{pdf,doc,rtf}";
          fg = "green";
        }
        {
          mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}";
          fg = "magenta";
        }
        {
          mime = "*";
          is = "orphan";
          bg = "lightgreen";
        }
        {
          mime = "*";
          is = "exec";
          fg = "lightblue";
        }
        {
          url = "*/";
          fg = "blue";
        }
        {
          mime = "*";
          fg = "gray";
        }
      ];
    };
  };
}
