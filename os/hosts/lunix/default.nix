# this is very important do not delete it
{ self, inputs, ... }: {
  flake.nixosConfigurations.lunix = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.lunix
    ];
  };
}
