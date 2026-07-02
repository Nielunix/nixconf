{...}: {
   flake.homeModules.desktopapp = { pkgs, ... }: {
      home.packages = [
	 # steam niri
	 (pkgs.makeDesktopItem {
	    name = "steam";
	    desktopName = "Steam (niri)";
	    exec = "steam -system-composer";
	    icon = "steam";
	    categories = ["Game"];
	 })

	 #Sober + gamescope
	 (pkgs.makeDesktopItem {
	    name = "Sober";
	    desktopName = "Sober (gamescope)";
	    exec = "gamescope -w 1280 -h 800 -W 3480 -H 2800 --force-grab-cursor --fullscreen flatpak run org.vinegarhq.Sober";
	    icon = "sober";
	    categories = ["Game"];
	 })
      ];
   };
}
