{ config, pkgs, ... }:
{
  plugins.notify = {
    enable = true;
    settings = {
      timeout = 3000;
    };
  };
}