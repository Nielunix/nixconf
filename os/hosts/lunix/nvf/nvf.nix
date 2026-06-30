{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.nvf = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      inputs.nvf.nixosModules.default
      # self.nixosModules.nvfOptions
      # self.nixosModules.nvfKeymaps
      # self.nixosModules.nvfAutocmds
      # self.nixosModules.nvfPlugins
    ];
    programs.nvf = {
      enable = false;
      settings = {
        vim = {
          viAlias = true;
          vimAlias = true;

          additionalRuntimePaths = ["~/.config/nvim"];
          startPlugins = with pkgs; [
            vimPlugins.nvim-autopairs
            vimPlugins.blink-cmp
            vimPlugins.everforest
            vimPlugins.conform-nvim
            vimPlugins.mason-lspconfig-nvim
            vimPlugins.nvim-lspconfig
            vimPlugins.luasnip
            vimPlugins.mini-nvim
            vimPlugins.neo-tree-nvim
            vimPlugins.telescope-nvim
            vimPlugins.todo-comments-nvim
            vimPlugins.treesitter-modules-nvim
            vimPlugins.nvim-treesitter
            vimPlugins.nvim-whichkey-setup-lua
            "which-key-nvim"
          ];


          # theme = lib.mkForce {
          #   enable = true;
          #   name = "everforest";
          #   style = "hard";
          # };
        };
      };
    };
  };
}
