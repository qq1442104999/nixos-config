{
  disko.devices = {
    disk.main = {
      device = "/dev/sda";
      type = "disk";

      content = {
        type = "gpt";

        partitions = {

          # EFI 分区
          ESP = {
            size = "1G";
            type = "EF00";

            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };

          # swap 分区
          swap = {
            size = "8G"; # 可以根据内存大小调整
            type = "8200"; # Linux swap 类型

            content = {
              type = "swap";
            };
          };

          # root 分区
          root = {
            size = "100%"; # 剩余全部空间
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
            };
          };

        };
      };
    };
  };
}