{...}: {
  flake.nixosModules.nvfPlugins = { pkgs, ... }: {
    imports = [];
    programs.nvf.vim = {
    
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
        enable =  true;
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
    };
  };
}

