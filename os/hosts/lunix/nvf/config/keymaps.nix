{ ... }: {
  flake.nixosModules.nvfKeymaps = {...}: {
    programs.nvf.settings.vim = {};
  };
}
