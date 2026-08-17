{ inputs, ... }: {
  flake.nixosModules.programs = { pkgs, ... }: {
    programs = {
      niri.enable = true;

      steam = {
        enable = true;
        remotePlay.openFirewall = true;
      };

      kdeconnect.enable = true;

      zsh.enable = true;
    };
  };
}
