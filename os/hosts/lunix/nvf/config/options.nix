{...}: {
  flake.nixosModules.nvfOptions = {...}: {
    programs.nvf.settings.vim = {
      options = {
        autoindent = true;
        breakindent = true;
        undofile = true;
        ignorecase = true;
        smartcase = true;
        signcolumn = "yes";
        updatetime = 200;
        timeoutlen = 300;
        splitright = true;
        splitbelow = true;
        listchars = {
          tab = "» ";
          trail = "·";
          nbsp = "␣";
        };

        inccommand = "split";
        cursorline = true;
        scrolloff = 10;
        confirm = true;
        termguicolors = true;

        shiftwidth = 2;
        number = true;
        relativenumber = true;
        mouse = "a";
      };

      globals = {
        mapleader = " ";
        maplocalleader = " ";
      };
    };
  };
}
