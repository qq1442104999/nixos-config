{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    inputs.home-manager.nixosModules.home-manager  # <-- 系统级 Home Manager 模块
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs; };
        users.wang = import ../../home/wang/home.nix;
      };
    }

    ../../modules/nixos/core/boot.nix
    ../../modules/nixos/core/locale.nix
    ../../modules/nixos/core/nix.nix
    ../../modules/nixos/core/env.nix
    ../../modules/nixos/core/input.nix
    
    ../../modules/nixos/system/fonts.nix
    ../../modules/nixos/system/users.nix
    ../../modules/nixos/system/audio.nix
    ../../modules/nixos/system/network.nix
    ../../modules/nixos/system/packages.nix

    ../../modules/nixos/desktop/niri.nix
  ];

  # ==================================================
  # 系统基本信息
  # ==================================================
  networking.hostName = "nixos";      # 主机名

  # ==================================================
  # 系统状态版本
  # ==================================================
  system.stateVersion = "25.11";
}