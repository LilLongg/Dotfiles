{ pkgs, ... }: {
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  users.users.TNonggChann = {
    isNormalUser = true;
    extraGroups = [
      "audio"
      "input"
      "networkmanager"
      "video"
      "wheel"
    ];
  };
}
