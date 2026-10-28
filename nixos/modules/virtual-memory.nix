{
swapDevices = [ { device = "/.swapvol/swapfile"; } ];
  boot.tmp = {
    useTmpfs = true;
    cleanOnBoot = false;
  };
  zramSwap = {
    enable = true;
    algorithm = "lz4";
    priority = 1023;
  };
}
