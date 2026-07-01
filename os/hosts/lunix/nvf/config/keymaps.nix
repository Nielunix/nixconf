{...}: {
  flake.nixosModules.nvfKeymaps = {...}: {
    programs.nvf.settings.vim.keymaps = [
      {
        mode = ["n" "v"];
        key = "<leader>cf";
        action = "<cmd>lua require('conform').format { async = true }<CR>";
        desc = "Format Buffer";
      }
    ];
  };
}
