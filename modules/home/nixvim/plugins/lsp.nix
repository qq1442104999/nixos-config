{ config, pkgs, ... }:
{
  plugins.lsp = {
    enable = true;
    servers = {
      lua_ls.enable = true;
      pyright.enable = true;
      ts_ls.enable = true;
    };
  };
}
