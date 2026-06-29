{self, ... }: {
  flake.homeModules.git = { ... }: {
    programs.git = {
      enable = true;
      settings = {
	user = {
	  name = "Lunix";
	  email = "niels.canonville@proton.me";
	  };
	};
    };
  };
}
