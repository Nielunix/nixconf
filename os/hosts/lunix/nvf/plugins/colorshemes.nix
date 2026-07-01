{
  lib,
  pkgs,
  ...
}: {
  flake.nixosModules.nvfPluginsColorsheme = {pkgs, ...}: {
    programs.nvf.settings.vim = {
      theme = lib.mkForce {
        enable = true;
        name = "everforest";
        style = "hard";
      };
      # lazy.plugins = {
      #   "everforest" = {
      #     package = pkgs.vimPlugins.everforest;
      #     setupModule = "everforest";
      #     setupOpts = {
      #       background = "hard";
      #       italics = false;
      #       ui_contrast = "low";
      #     };
      #     after = ''vim.cmd.colorsheme "everforest"'';
      #   };
      # };
    };
  };
}
