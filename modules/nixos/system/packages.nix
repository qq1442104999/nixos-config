{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    git
    file
    zsh
    xclip
    nix-prefetch-scripts
  ];
}