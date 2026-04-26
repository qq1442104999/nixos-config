{ pkgs, ... }:

{
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";

    kvantum = {
      enable = true;
      themes = [
        (pkgs.catppuccin-kvantum.override {
          variant = "mocha";
          accent = "lavender";
        })
      ];
      settings.General.theme = "catppuccin-mocha-lavender";
    };
  };

  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };

    font = {
      name = "Source Han Sans Regular"; 
      size = 15; 
    };

    theme = {
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ]; # 选择你喜欢的点缀色
        size = "standard";
        variant = "mocha";
      };
      name = "catppuccin-mocha-lavender-standard";
    };
  };

  home.packages = with pkgs; [ 
    nwg-look
  ];
}