{ pkgs, ... }: {
  users.defaultUserShell = pkgs.fish;
  users.users.TNonggChann = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };
  programs.fish = {
    enable = true;
    generateCompletions = true;
    vendor.completions.enable = true;
  };
}
