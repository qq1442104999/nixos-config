{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    targets = {
      noctalia-shell = {
        enable = false;
      };
      nixvim = {
        enable = true;
        plugin = "base16-nvim";
      };

    };
  };

  home.packages = with pkgs; [
    base16-schemes
  ];
}
