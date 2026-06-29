{ self, inputs, ... }: {
 flake.homeModules.lunixHome = { pkgs, ... }: {
    imports = [
	self.homeModules.kitty
    ];

    home.packages = [ 
    	pkgs.hello
	inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

      programs.git = {
    enable = true;
    settings = {
      user = {
        name  = "Lunix";
        email = "niels.canonville@proton.me";
      };
      init.defaultBranch = "main";
    };
};
    home.stateVersion = "26.05";
  };
}
