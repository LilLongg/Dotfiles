{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user = {
        name = "LilLongg";
        email = "glivingstone70@gmail.com";
      };
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
