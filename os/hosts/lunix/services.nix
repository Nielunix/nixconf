{...}: {
  flake.nixosModules.services = { ... }: {
    services.flatpak.enable = true;
  };
}
