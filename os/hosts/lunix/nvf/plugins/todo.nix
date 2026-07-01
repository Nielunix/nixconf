{...}: {
  flake.nixosModules.nvfPluginsTodo = {...}: {
    programs.nvf.settings.vim = {
      notes.todo-comments = {
        enable = true;
        setupOpts = {
          signs = false;
        };
      };
    };
  };
}
