{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./packages.nix

    ./modules
  ];
  networking.hostName = "TNonggChann-no-PC"; # Define your hostname.
  time.timeZone = "Asia/Ho_Chi_Minh";
  system.stateVersion = "26.05"; # Did you read the comment?
}
