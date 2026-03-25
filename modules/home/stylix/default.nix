{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    image = ./wallpaper.png;

    polarity = "dark";

    # 🔤 字体（推荐组合）
    #fonts = {
    #  monospace = {
    #    package = pkgs.jetbrains-mono;
    #    name = "JetBrains Mono";
    #  };

    #  sansSerif = {
    #    package = pkgs.noto-fonts;
    #    name = "Noto Sans";
    #  };
    #};

    # 🎯 自动应用
    targets = {
      kitty.enable = true;
      zsh.enable = true;
      neovim.enable = true;
      fzf.enable = true;
      bat.enable = true;
      git.enable = true;
    };
  };

  home.packages = with pkgs; [
    base16-schemes
  ];
}