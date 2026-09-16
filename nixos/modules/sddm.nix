{ pkgs, ... }:
let
  sddm-astronaut =
    (pkgs.sddm-astronaut.override {
      embeddedTheme = "hyprland_kath";
      themeConfig = {
        ScreenHeight = "1200";
        DateFormat = ''"dddd, MMMM dd"'';
        BackgroundPlaceholder = "Backgrounds/noir.jpg";
        Background = "Backgrounds/noir.mp4";
        HideSystemButtons = "false";
        HideVirtualKeyboard = "true";
        AllowUppercaseLettersInUsernames = "true";
      };
    }).overrideAttrs
      (oldAttrs: {
        installPhase = oldAttrs.installPhase + ''
          chmod u+w $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/
          cp ${./Sddm_Backgrounds/noir.jpg} $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/noir.jpg
          cp ${./Sddm_Backgrounds/noir.mp4} $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/noir.mp4
        '';
      });
in
{
  environment.systemPackages = [ sddm-astronaut ];
  services.displayManager.sddm = {
    package = pkgs.kdePackages.sddm;
    enable = true;
    enableHidpi = true;
    theme = "sddm-astronaut-theme";
    extraPackages = with pkgs.kdePackages; [
      qtmultimedia
    ];
    settings = {
      Theme = {
        CursorTheme = "Bibata-Modern-Ice";
        CursorSize = 24;
      };
    };
    wayland = {
      enable = true;
      compositor = "kwin";
    };
  };
}
