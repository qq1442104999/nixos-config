{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;

    profiles.default = {
      extensions =
        (with pkgs.vscode-extensions; [
          ms-ceintl.vscode-language-pack-zh-hans
          jnoortheen.nix-ide
          catppuccin.catppuccin-vsc
          pkief.material-icon-theme
          intellsmi.comment-translate
          tamasfe.even-better-toml
      ]);

      userSettings = {
        "locale" = "zh-cn";
        "workbench.colorTheme" = "Catppuccin Mocha";
        "workbench.iconTheme" = "material-icon-theme";
        "editor.fontFamily" = "'Fira Code', 'Source Code Pro', Consolas, 'Courier New', monospace";
        "editor.fontLigatures" = true;
        "editor.fontSize" = 17;
        "editor.lineHeight" = 22;
        "editor.tabSize" = 2;
        "editor.minimap.enabled" = false;
        "files.trimTrailingWhitespace" = true;
        "files.insertFinalNewline" = true;
        "files.autoSave" = "onFocusChange";
        "git.confirmSync" = false;
        "git.enableSmartCommit" = true;
      };
    };
  };
}
