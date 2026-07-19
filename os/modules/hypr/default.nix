{ inputs, ... }: {
  flake.homeModules.hyprland = { config, ... }: {
    xdg.configFile = {
      "hypr" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/os/modules/hypr";
        recursive = true;
      };
    };
  };
}
