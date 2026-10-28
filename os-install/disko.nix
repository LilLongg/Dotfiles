{
  disko.devices = {
    disk = {
      my-disk = {
        device = "/dev/nvme0n1";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              label = "ESP";
              type = "EF00";
              size = "1G";
              priority = 1;
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            ROOT = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted-root";
                settings.allowDiscards = true;
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ];
                  subvolumes = {
                    "@root" = {
                      mountpoint = "/";
                      mountOptions = [
                        "subvol=root"
                        "noatime"
                        "compress=zstd"
                      ];
                    };
                    "@swap" = {
                      mountpoint = "/.swapvol";
                      swap.swapfile.size = "16G";
                    };
                    "@nix" = {
                      mountpoint = "/nix";
                      mountOptions = [
                        "subvol=nix"
                        "noatime"
                        "nodatacow"
                        "nodatasum"
                        "compress=zstd:1"
                      ];
                    };
                    "@log" = {
                      mountpoint = "/var/log";
                      mountOptions = [
                        "subvol=log"
                        "noatime"
                        "nodatacow"
                        "nodatasum"
                        "compress=zstd:1"
                      ];
                    };
                    "@home" = {
                      mountpoint = "/home";
                      mountOptions = [
                        "subvol=home"
                        "noatime"
                        "compress=zstd:1"
                      ];
                    };
                    "/home/TNonggChann" = { };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
