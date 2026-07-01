{lib, ...}: {
  flake.nixosModules.nvfPluginsWichkey = {...}: {
    programs.nvf.settings.vim = {
      binds.whichKey = {
        enable = true;
        setupOpts = {
          delay = 0;
          icons = {
            mappings = lib.mkLuaInline "vim.g.have_nerd_font";
          };

          spec = {
            "<leader>s" = {
              group = "[S]earch";
              mode = ["n" "v"];
            };
            "<leader>u" = {
              group = "[U]pdate";
              mode = ["n" "v"];
            };
            "<leader>t" = {group = "[T]oggle";};
            "<leader>h" = {
              group = "Git [H]unk";
              mode = ["n" "v"];
            };
            "gr" = {
              group = "LSP Actions";
              mode = ["n"];
            };
          };
        };
      };
    };
  };
}
