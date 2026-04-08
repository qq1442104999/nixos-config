{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    polarity = "dark"; 

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
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 14;
        #desktop = 10;
        terminal = 14;
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };

    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      light = "Papirus-Light";
      dark = "Papirus-Dark";
    };

    targets = {
      noctalia-shell = {
        enable = false;
      };

      nixvim = {
        enable = true;
        plugin = "base16-nvim";
      };

      kde.enable = true;

      gtk.enable = true;

      qt = {
        enable = true;
        #platform = "qtct";
      };
    };
  };

  gtk = {
    enable = true;

    theme = {
      name = "catppuccin-mocha-blue-standard";
      package = pkgs.catppuccin-gtk;
  };

  qt = {
    enable = true;

    platformTheme.name = "qtct";  # 关键

    style = {
      name = "kvantum";           # 推荐
    };
  };

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qtct";
    QT_STYLE_OVERRIDE = "kvantum";
        
    QT_QPA_PLATFORM = "wayland";
  };

  home.packages = with pkgs; [
    base16-schemes

    libsForQt5.qt5ct
    qt6ct
    kdePackages.breeze

    libsForQt5.qtstyleplugin-kvantum
    catppuccin-kvantum

    vlc
  ];
}
