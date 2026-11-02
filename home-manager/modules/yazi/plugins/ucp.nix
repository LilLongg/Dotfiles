{ lib, pkgs, ... }: {
  programs.yazi = {
    plugins = {
      ucp = {
        package = pkgs.stdenv.mkDerivation rec {
          pname = "ucp.yazi";
          name = lib.removeSuffix ".yazi" pname;
          src = pkgs.fetchFromGitHub {
            owner = "simla33";
            repo = "${pname}";
            rev = "79043fbbfd39b7b9ae0142d11b315272dd90d33b";
            hash = "sha256-oL3fss8/U6IH2y5B/YdK17h4LvN4XsPypmC+yzJBMnE=";
          };
          installPhase = ''
            cp -r . $out
          '';
        };
      };
    };
    keymap = {
      mgr.prepend_keymap = [
        {
          on = "p";
          run = "plugin ucp paste";
          desc = "Paste";
        }
        {
          on = "p";
          run = "plugin ucp paste notify";
          desc = "Paste";
        }
        {
          on = "y";
          run = "plugin ucp copy";
          desc = "Copy";
        }
        {
          on = "y";
          run = "plugin ucp copy notify";
          desc = "Copy";
        }
      ];
    };
  };
}
