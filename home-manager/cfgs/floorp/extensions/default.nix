{ config, pkgs, ... }:
let
  profileName = "${config.home.username}";
in
{
  programs.floorp.profiles."${profileName}" = {
    settings."extensions.autoDisableScopes" = 0;
    extensions = {
      force = true;
      packages = with pkgs.firefoxAddons; [
        bitwarden-password-manager # {446900e4-71c2-419f-a6a7-df9c091e268b}
        gnome-download-notifications # gnome-download-notify@ion201
        hide-youtube-shorts # {88ebde3a-4581-4c6b-8019-2a05a9e3e938}
        pywalfox # pywalfox@frewacom.org
        return-youtube-dislikes # {762f9885-5a13-4abd-9c77-433dcd38b8fd}
        search_by_image # {2e5ff8c8-32fe-46d0-9fc8-6b8986621f3c}
        sponsorblock # sponsorBlocker@ajay.app
        tampermonkey # firefox@tampermonkey.net
        ublock-origin # uBlock0@raymondhill.net
        youtube-anti-translate-mv3 # youtube-anti-translate-mv3@namakeingo.co.uk
      ];
    };
  };
}
