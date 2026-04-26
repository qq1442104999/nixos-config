{ pkgs, ... }: 
{
  programs.niri.enable = true;
  
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.niri}/bin/niri";
      user = "wang";
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "gtk";
  };

  environment.systemPackages = with pkgs; [
    noctalia-shell
    
    wl-clipboard
    xwayland-satellite
  ];
}
