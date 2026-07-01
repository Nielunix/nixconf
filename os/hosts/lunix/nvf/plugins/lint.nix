{...}: {
  flake.nixosModules.nvfPluginsLint = {...}: {
    programs.nvf.settings.vim = {
      diagnostics.nvim-lint.enable = true;
    };
  };
}
