{...}: {
  flake.nixosModules.nvfPlugins = { pkgs, lib, ... }: {
    imports = [];
    programs.nvf.settings.vim = {
    
      #autopairs
      autopairs.nvim-autopairs.enable = true;
     
      #Git
      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = false; # throws an annoying debug message
        neogit.enable = true;
      };

      #Blink-cmp
      autocomplete.blink-cmp = {
        enable =  false;
        friendly-snippets.enable = true;
        setupOpts = {
          keymap = {
            preset = "none";
            "<C-space>" = [ "show" "show_documentation" "hide_documentation" ];
            "<C-e>" = [ "hide" "fallback" ];
            "<CR>" = [ "accept" "fallback" ];
            "<Up>" = [ "snippet_forward" "fallback" ];
            "<Down>" = [ "snippet_backward" "fallback" ];
            "<S-Tab>" = [ "select_prev" "fallback" ];
            "<Tab>" = [ "select_next" "fallback" ];
            "<C-p>" = [ "select_prev" "fallback_to_mappings" ];
            "<C-n>" = [ "select_next" "fallback_to_mappings" ];
            "<C-b>" = [ "scroll_documentation_up" "fallback" ];
            "<C-f>" = [ "scroll_documentation_down" "fallback" ];
            "<C-k>" = [ "show_signature" "hide_signature" "fallback" ];
          };
        };
      };

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

      #lsp
          lsp = {
      # This must be enabled for the language modules to hook into
      # the LSP API.
      enable = true;

        formatOnSave = true;
        lspkind.enable = false;
        lightbulb.enable = true;
        lspsaga.enable = false;
        trouble.enable = true;
        otter-nvim.enable = true;
        nvim-docs-view.enable = true;
        presets.harper.enable = true;
        lspconfig.enable = true;
        servers = {
          nixd.enable = true;
          qmlls.enable = true;
        };

      };

      #languages
      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;
        nix.enable = true;
        qml.enable = true;
        typescript.enable = true;
        json.enable = true;
        toml.enable = true;
      };

      telescope.enable = true;
      treesitter.enable = true;
    };
  };
}

