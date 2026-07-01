{pkgs, ...}: {
  flake.nixosModules.nvfPluginsTelescope = {pkgs, ...}: {
    programs.nvf.settings.vim = {
      telescope = {
        enable = true;
        extensions = [
          {
            name = "fzf";
            packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
            setup = {fzf = {fuzzy = true;};};
          }
        ];

        mappings = {
          buffers = "<leader>fb";
          diagnostics = "<leader>fd";
          findFiles = "<leader>ff";
          findProjects = "<leaderfp";
          helpTags = "<leader>fh";
          lspDefinitions = "<leader>fld";
          lspDocumentSymbols = "<leader>flds";
          lspImplementations = "<leader>fli";
          lspReferences = "<leader>flr";
          lspTypeDefinitions = "<leader>fltd";
          lspWorkspaceSymbols = "<leader>flws";
          open = "<leader>ft";
          resume = "<leader>fr";
          treesitter = "<leader>fs";
        };
      };
    };
  };
}
