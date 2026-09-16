{ pkgs, ... }: {
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vpl-gpu-rt
      intel-compute-runtime
    ];
    extraPackages32 = with pkgs; [
      pkgsi686Linux.intel-vaapi-driver
    ];
  };
  hardware.enableRedistributableFirmware = true;
  boot.kernelParams = [ "i915.enable_guc=3" ];
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };
  services.xserver.videoDrivers = [ "modesetting" ];
}
