{ pkgs, ... }: {
  fonts = {
    fontDir.enable = true;
    fontconfig = {
      enable = true;
      includeUserConf = true;
    };
    packages = with pkgs; [
      (stdenv.mkDerivation {
        name = "Some-Random-System-Fonts";
        src = ./Fonts;
        installPhase = ''
          mkdir -p $out/share/fonts/truetype
          cp * $out/share/fonts/truetype/
        '';
      })
    ];
  };
}
