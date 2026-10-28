{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  env.GREET = "devenv";
  env.QML_IMPORT_PATH = "${config.env.DEVENV_PROFILE}/lib/qt-6/qml";
  packages = with pkgs; [
    quickshell
    qt6.qt5compat
    qt6.qtbase
    qt6.qtdeclarative
    qt6.qtwayland
  ];
}
