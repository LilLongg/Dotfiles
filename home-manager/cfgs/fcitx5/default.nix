{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
  };

  home.sessionVariables = {
    INPUT_METHOD = "fcitx";
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "ibus";
    XMODIFIERS = "@im=fcitx";
  };

  imports = [
    ./addons.nix
    ./bamboo.nix
    ./config.nix
    ./unikey.nix
  ];
}
