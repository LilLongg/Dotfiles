{ pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      timeout = 10;
      efi = {
        efiSysMountPoint = "/boot";
        canTouchEfiVariables = true;
      };
      grub = {
        efiSupport = true;
        device = "nodev";
        default = "saved";
        useOSProber = true;
        theme = "${
          (pkgs.fetchFromGitHub {
            owner = "lfelipe1501";
            repo = "Atomic-GRUB2-Theme";
            rev = "7e5fe5167c3768060aeabfe6fa45e55336b4b33e";
            hash = "sha256-M9nnh43fhPYXOKKhVgRM5V6AROXbdzI30af9OP+p0Vw=";
          })
        }/Atomic";
      };
    };
  };
}
