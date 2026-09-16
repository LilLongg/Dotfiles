{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        on_unlock_cmd = "systemctl restart --user waybar";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "mmsg dispatch wakeup_monitor,";
      };

      listener = [
        {
          timeout = 600;
          on-timeout = "brightnessctl -s set 5%";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 900;
          on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0";
          on-resume = "brightnessctl -rd rgb:kbd_backlight";
        }
        {
          timeout = 1200;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 1200;
          on-timeout = "mmsg dispatch sleep_monitor,";
          on-resume = "mmsg dispatch wakeup_monitor,";
        }
        {
          timeout = 1800;
          on-timeout = "systemctl hibernate";
        }
      ];
    };
  };
}
