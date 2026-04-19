{ pkgs, lib, ... }:
let
  tmuxConf = pkgs.fetchFromGitHub {
    owner = "gpakosz";
    repo = ".tmux";
    rev = "master";
    sha256 = "sha256-nXm664l84YSwZeRM4Hsweqgz+OlpyfwXcgEdyNGhaGA=";
  };
in
{
  programs.tmux = {
    enable = true;
    extraConfig = 
      builtins.readFile "${tmuxConf}/.tmux.conf";
  };

  xdg.configFile."tmux/.tmux.conf.local".source = ../omzsh/scripts/.tmux.conf.local;
}