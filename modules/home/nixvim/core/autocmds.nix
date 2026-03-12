{ config, pkgs, ... }:
{
  programs.nixvim.autoCmd = [
    {
      event = [ "BufWritePre" ];
      pattern = "*";
      command = "silent! %s/\\s\\+$//e";
      desc = "Trim trailing whitespace on save";
    }
  ];
}
