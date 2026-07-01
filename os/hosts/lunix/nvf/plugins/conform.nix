{lib, ...}: {
  flake.nixosModules.nvfPluginsConform = {...}: {
    programs.nvf.settings.vim = {
      formatter.conform-nvim = {
        enable = true;
        setupOpts = {
          notify_on_error = false;
          default_format_opts = {
            lsp_format = "fallback";
          };
          formatters_by_ft = {
            javascript = lib.mkLuaInline ''{ 'prettierd', 'prettier', stop_after_first = true }'';
            qml = lib.mkLuaInline ''{ 'qmlformat', 'js_beautify', stop_after_first = true }'';
          };
        };
      };
    };
  };
}
