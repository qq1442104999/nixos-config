{ pkgs, ... }:  
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
      format = ''
        ╭─$directory$git_branch$git_status$cmd_duration
        ╰─$character
      '';

      directory = {
        style = "bold cyan";
        truncation_length = 3;
        format = "[$path]($style) ";
      };

      git_branch = {
        symbol = " ";
        style = "bold purple";
        format = "[$symbol$branch]($style) ";
      };

      git_status = {
        style = "yellow";
        format = "[$all_status]($style) ";
      };

      cmd_duration = {
        min_time = 500;
        format = "took [$duration]($style) ";
      };

      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };
    };
  };
}