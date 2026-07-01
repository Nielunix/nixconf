{...}: {
  flake.nixosModules.nvfPluginsLsp = {...}: {
    programs.nvf.settings.vim = {
      lsp = {
        enable = true;
        formatOnSave = true;
        trouble.enable = true;
        otter-nvim.enable = true;
        nvim-docs-view.enable = true;
        lspconfig.enable = true;
        servers = {
          qmlls.enable = true;
        };
      };
    };
  };
}
