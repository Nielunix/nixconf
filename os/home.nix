{ self, inputs, ... }: {
 flake.homeModules.lunixHome = { pkgs, lib, config, ... }: {
    imports = [
	self.homeModules.kitty
	self.homeModules.pkgs
	self.homeModules.git
	self.homeModules.fish
	self.homeModules.desktopapp
    ];
    xdg.configFile."niri/config.kdl" = {
      	source = config.lib.file.mkOutOfStoreSymlink "/home/lunix/nixconf/os/programs/niri/config.kdl";
	recursive = true;
    };


    home.stateVersion = "26.05";
  };
}

