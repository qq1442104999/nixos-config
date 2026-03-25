{ config, ... }:
{
  programs.television = {
      enable = true;
      enableZshIntegration = true;
    };
}