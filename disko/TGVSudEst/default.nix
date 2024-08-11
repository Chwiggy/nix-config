{
  disko.devices = {
    disk = {
      nvme0n1 = {
        type = "disk";
        device = "/dev/disk/by-path/pci-0000:00:0e.0-pci-10000:e1:00.0-nvme-1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [
                  "defaults"
                ];
              };
            };
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted";
                extraOpenArgs = [];
                settings = {
                  # if you want to use the key for interactive login be sure there is no trailing newline
                  # for example use `echo -n "password" > /tmp/secret.key`
                  #keyFile = "/tmp/secret.key";
                  allowDiscards = true;
                };
                #additionalKeyFiles = ["/tmp/additionalSecret.key"];
                content = {
                  type = "lvm_pv";
                  vg = "pool";
                };
              };
            };
          };
        };
      };
    };
    lvm_vg = {
      pool = {
        type = "lvm_vg";
        lvs = {
          swap = {
            size = "16G";
            content = {
              type = "swap";
              resumeDevice = true; # resume from hiberation from this device
            };
          };
          root = {
            size = "100%FREE";
            content = {
              type = "btrfs";
              extraArgs = ["-f"];
              mountpoint = "/";
              mountOptions = [
                "noatime"
              ];
            };
          };
        };
      };
    };
  };
}
