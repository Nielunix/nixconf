{ inputs, ... }: {
  flake.nixosModules.programs = { pkgs, ... }: {
    programs = {
      niri.enable = true;

      steam = {
        enable = true;
        remotePlay.openFirewall = true;
      };

      hyprland = {
        enable = true;
        withUWSM = true;
        xwayland.enable = true;

        # set the flake package
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        # make sure to also set the portal package, so that they are in sync
        portalPackage =
          inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      };
      kdeconnect.enable = true;

      # zsh = {
      #   enable = true;
      # };
    };
  };
}
