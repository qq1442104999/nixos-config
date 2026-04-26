{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    inputs.disko.nixosModules.disko
    ./disk-config.nix
    ./hardware-configuration.nix

    inputs.home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs; };
        users.wang = import ../../home/wang/home.nix;
      };
    }

    ../default.nix
  ];

  # ==================================================
  # 系统基本信息
  # ==================================================
  networking.hostName = "nixos";      # 主机名

  # ==================================================
  # 系统状态版本
  # ==================================================
  system.stateVersion = "26.05";
}