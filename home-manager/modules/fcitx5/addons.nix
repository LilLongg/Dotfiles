{ pkgs, ... }: {
  i18n.inputMethod.fcitx5.addons = with pkgs; [
    fcitx5-gtk
    fcitx5-im-emoji-picker
    fcitx5-lotus
    fcitx5-mozc
    kdePackages.fcitx5-configtool
    kdePackages.fcitx5-qt
  ];
  home.packages = with pkgs; [
    qt5.qtwayland
  ];
}
