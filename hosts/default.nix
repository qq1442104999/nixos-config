{ ... }:
{
  imports = [
    ../modules/nixos/core/boot.nix
    ../modules/nixos/core/locale.nix
    ../modules/nixos/core/nix.nix
    ../modules/nixos/core/env.nix
    ../modules/nixos/core/input.nix
    
    #../modules/nixos/system/fonts.nix
    ../modules/nixos/system/users.nix
    ../modules/nixos/system/audio.nix
    ../modules/nixos/system/network.nix
    ../modules/nixos/system/packages.nix

    ../modules/nixos/desktop/niri.nix
    #../modules/nixos/desktop/gtk-qt.nix
    ../modules/nixos/desktop/fcitx5.nix
    ../modules/nixos/desktop/stylix.nix
  ];
}