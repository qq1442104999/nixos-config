{ inputs, ... }:

{
  imports = [
    inputs.disko.nixosModules.disko
    ./disk-config.nix
    ./hardware.nix

    inputs.home-manager.nixosModules.home-manager  # <-- 系统级 Home Manager 模块
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs; };
        users.wang = import ../../home/laptop/home.nix;
      };
    }

    ../default.nix
  ];

  # ==================================================
  # 系统基本信息
  # ==================================================
  networking.hostName = "nixos";      # 主机名

  # ==================================================
  # 网络
  # ==================================================
  networking.networkmanager.ensureProfiles.profiles = {
    "H3C_A96AFE_5G" = {
      connection = {
        id = "H3C_A96AFE_5G";
        type = "wifi";
        autoconnect = true;
        interface-name = "wlp0s20f3";
      };
      wifi = {
        mode = "infrastructure";
        ssid = "H3C_A96AFE_5G";
      };
      wifi-security = {
        auth-alg = "open";
        key-mgmt = "wpa-psk";
        psk = "80808080"; # 你的密码
      };
      ipv4 = {
        method = "auto";
      };
    };
  };

  # ==================================================
  # 电源管理
  # ==================================================
  services.power-profiles-daemon.enable = true; # 电源模式管理（performance/balanced/powersave）

  # ==================================================
  # 系统状态版本
  # ==================================================
  system.stateVersion = "25.11";
}
