{ inputs, ... }: {
  flake.nixosModules.programs = { pkgs, ... }: {
    programs = {
      niri.enable = true;
      fish.enable = true;
    };

    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };

    programs.hyprland = {
      enable = true;
      # set the flake package
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      # make sure to also set the portal package, so that they are in sync
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
    programs.kdeconnect.enable = true;

  };
}
