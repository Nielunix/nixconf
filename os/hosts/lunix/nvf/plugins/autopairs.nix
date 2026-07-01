{...}: {
  flake.nixosModules.nvfPluginsAutopairs = {...}: {
    programs.nvf.settings.vim = {
      autopairs.nvim-autopairs.enable = true;
    };
  };
}
