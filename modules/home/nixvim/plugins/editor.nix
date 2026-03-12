{ config, pkgs, ... }:
{
  plugins = {
    nvim-tree.enable = true;
    comment.enable = true;
    nvim-autopairs.enable = true;
  };
}
