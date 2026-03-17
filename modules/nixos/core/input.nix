{ ... }: 
{
  services.xserver.enable = true; # 提供 xkb

  services.xserver.xkb = {
    layout = "us";
  };
}