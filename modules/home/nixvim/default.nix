{ config, pkgs, inputs, ... }:

{
  imports = [
      inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    globals = {
      loaded_netrw = 1;
      loaded_netrwPlugin = 1;
      mapleader = " ";
    };

    imports = [
      ./core/options.nix
      ./core/keymaps.nix
      ./core/autocmds.nix

      #./plugins/ui/colorschemes.nix
      ./plugins/ui/lualine.nix
      ./plugins/ui/noice.nix
      ./plugins/ui/notify.nix
      ./plugins/ui/which-key.enable.nix
      ./plugins/ui/alpha.nix
      ./plugins/ui/indent-blankline.nix

      ./plugins/editor.nix
      ./plugins/telescope.nix
      ./plugins/treesitter.nix
      ./plugins/lsp.nix
      ./plugins/cmp.nix
      ./plugins/git.nix
      ./plugins/bufferline.nix
      ./plugins/mini.nix
    ];
  };
}
