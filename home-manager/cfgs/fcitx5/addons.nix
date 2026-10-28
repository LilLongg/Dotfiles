{ pkgs-stable, ... }: {
  i18n.inputMethod.fcitx5.addons = with pkgs-stable; [
    fcitx5-bamboo
    fcitx5-gtk
    fcitx5-im-emoji-picker
    fcitx5-mozc
    kdePackages.fcitx5-unikey
    kdePackages.fcitx5-configtool
  ];
}
