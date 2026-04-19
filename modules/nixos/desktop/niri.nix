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

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "ghostty.desktop" ];
    };
  };

  # 定义文件类型与程序的关联
  xdg.mime = {
    enable = true;
    defaultApplications = {
      "terminal" = [ "ghostty.desktop" ];
      "x-scheme-handler/terminal" = [ "ghostty.desktop" ];
      "application/x-terminal-emulator" = [ "ghostty.desktop" ];
    };
  };


  environment.systemPackages = with pkgs; [
    noctalia-shell
    
    wl-clipboard
    xwayland-satellite
  ];
}
