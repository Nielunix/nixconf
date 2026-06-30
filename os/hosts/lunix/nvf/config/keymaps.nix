{...}: {
  flake.nixosModules.nvfKeymaps = {...}: {
    programs.nvf.settings.vim.keymaps = [
      {
        mode = ["n" "v"];
        key = "<leader>f";
        action = "function() require('conform').format { async = true } end";
        desc = "Format buffer";
      }
    ];
  };
}
