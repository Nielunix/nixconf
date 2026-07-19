{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.neovim = {
    pkgs,
    lib,
    ...
  }: {
    programs.neovim = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.neovim;
    };
  };

  perSystem = {pkgs, config, ...}: {
    packages.neovim = inputs.wrapper-modules.wrappers.neovim.wrap {
      inherit pkgs;
      imports = [
        self.module.neovim.config
      ];
    };
  };
}
