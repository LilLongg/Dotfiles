{
  programs.mangohud = {
    enable = true;
    settings = {
      time = true;
      time_format = "%X";

      gpu_temp = true;
      gpu_power = true;
      cpu_temp = true;
      cpu_power = true;
      cpu_mhz = true;

      vram = true;
      ram = true;

      round_corner = 10;
      hud_no_margin = true;

      horizontal = true;
      horizontal_stretch = true;

      font_size = 13;
    };
  };
}
