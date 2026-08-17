{ self, inputs, ... }: {
  flake.homeModules.lunixHome =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    {
      imports = [
        self.homeModules.kitty
        self.homeModules.zsh
        self.homeModules.pkgs
        self.homeModules.git
        # self.homeModules.fish
        self.homeModules.desktopapp
        self.homeModules.hyprland
      ];
      xdg.configFile = {
        "niri" = {
          source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/os/modules/niri";
          recursive = true;
        };
        "otter-launcher" = {
          source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/os/modules/otter-launcher";
          recursive = true;
        };
      };
      home.sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
      ];
      home.stateVersion = "26.05";
    };
}
