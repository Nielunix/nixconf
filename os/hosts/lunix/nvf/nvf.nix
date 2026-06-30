{ self, inputs, ... }: {
  flake.nixosModules.nvf = { pkgs, lib, ... }: {
    imports = [
      inputs.nvf.nixosModules.default
      self.nixosModules.nvfOptions
      self.nixosModules.nvfKeymaps
      self.nixosModules.nvfAutocmds
      self.nixosModules.nvfPlugins
    ];
    programs.nvf ={
      enable = true;
	vim = {
	  viAlias = true;
	  vimAlias = true;

          theme = lib.mkForce {
            enable = true;
            name = "everforest";
            style = "hard";
          };
        };
    };
  };
}
