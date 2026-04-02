{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];
  # configure options
  programs.noctalia-shell.enable = true;



  xdg.configFile."noctalia/settings.json".source =
    pkgs.lib.mkForce (
      config.lib.file.mkOutOfStoreSymlink 
        "${toString ./settings.json}"
    );

  #xdg.configFile."noctalia/settings.json".source =
  #  config.lib.file.mkOutOfStoreSymlink 
  #    "${toString ./settings.json}";
}