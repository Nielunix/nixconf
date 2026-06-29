{ ... }: {
  flake.nixosModules.programs = { pkgs, ... }: {
    programs.niri.enable = true;
    };
  }
