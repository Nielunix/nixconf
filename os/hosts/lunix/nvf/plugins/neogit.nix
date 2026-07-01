{...}: {
  flake.nixosModules.nvfPluginsNeoGit = {...}: {
    programs.nvf.settings.vim = {
      git.neogit = {
        enable = true;
        mappings.open = "<leader>gg";
      };
    };
  };
}
