{lib, ...}: {
  flake.nixosModules.nvfPluginsMini = {...}: {
    programs.nvf.settings.vim = {
      mini = {
        ai = {
          enable = true;
          setupOpts = {
            mappings = {
              around_next = "aa";
              inside_next = "ii";
            };
            n_lines = 500;
          };
        };
        icons.enable = true;
        statusline = {
          enable = true;
          setupOpts = {
            use_icons = lib.mkLuaInline ''vim.g.have_nerd_font'';
          };
        };
      };
    };
  };
}
