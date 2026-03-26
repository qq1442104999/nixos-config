{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    targets = {
      #fzf.enable = true;
    };
  };

  home.packages = with pkgs; [
    base16-schemes
  ];
}
