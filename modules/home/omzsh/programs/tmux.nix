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
    #extraConfig = (
    #  builtins.readFile (
    #    pkgs.replaceVars ./scripts/my_initContent.zsh{
    #      ZSH_CACHE_DIR = "${config.home.homeDirectory}/.cache/oh-my-zsh"; # Nix 会自动把这个路径替换成 /nix/store/...
    #    }
    #  )
    #);
  };
}