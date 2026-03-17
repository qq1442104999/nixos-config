{ ... }: 
{
  environment.variables = {
    TERM = "xterm-256color";
    CLIPBOARD = "wl-copy";
  };

  programs.zsh.enable = true;
  programs.nix-ld.enable = true;
}