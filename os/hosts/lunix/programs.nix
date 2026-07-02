{ ... }: {
  flake.nixosModules.programs = { pkgs, ... }: {
    programs = {
      niri.enable = true;
      fish.enable = true;
    };

    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };
  };
}
