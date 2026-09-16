{ pkgs, ... }: {
  i18n.inputMethod.fcitx5.addons = with pkgs; [
    fcitx5-bamboo
    fcitx5-im-emoji-picker
    fcitx5-mozc
    fcitx5-gtk
    kdePackages.fcitx5-unikey
    kdePackages.fcitx5-configtool
  ];
}
