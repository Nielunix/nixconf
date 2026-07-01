{pkgs, ...}: {
  flake.nixosModules.nvfPluginsTreesitter = {pkgs, ...}: {
    programs.nvf.settings.vim = {
      treesitter = {
        enable = true;
        addDefaultGrammars = true;
        autotagHtml = true;
        context.enable = true;
        grammars = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
          regex
          kdl
        ];
        indent.enable = true;
      };
    };
  };
}
