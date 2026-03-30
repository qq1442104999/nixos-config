{ pkgs, ... }:
let
  tmuxConf = pkgs.fetchFromGitHub {
    owner = "gpakosz";
    repo = ".tmux";
    rev = "master";
    sha256 = "sha256-xxxxx";
  };
in
{
  programs.tmux = {
    enable = true;
    extraConfig = 
      builtins.readFile "${tmuxConf}/.tmux.conf";
  };

  xdg.configFile."/tmux/.tmux.conf.local".source = ../scripts/tmux.conf.local;
}