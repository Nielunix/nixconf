{...}: {
  flake.nixosModules.nvfPluginsNeoTree = {...}: {
    programs.nvf.settings.vim = {
      filetree.neo-tree = {
        enable = true;
        setupOpts = {
          filesystem = {
            window = {
              mappings = {
                "<leader>q" = "close_window";
              };
            };
          };
        };
      };
    };
  };
}
