{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.source-han-sans;
        name = "Source Han Sans SC";
      };
      serif = {
        package = pkgs.source-han-sans;
        name = "Source Han Sans SC";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        application = 12;
        desktop = 10;
        terminal = 12;
      };
    };

    targets = {
      noctalia-shell = {
        enable = false;
      };
      nixvim = {
        enable = true;
        plugin = "base16-nvim";
      };
      kde.enable = false;
    };
  };

  home.packages = with pkgs; [
    base16-schemes
  ];
}
