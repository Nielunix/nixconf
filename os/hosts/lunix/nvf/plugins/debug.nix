{...}: {
  flake.nixosModules.nvfPluginsDebug = {...}: {
    programs.nvf.settings.vim = {
      debugger = {
        nvim-dap.enble = true;
      };
    };
  };
}
