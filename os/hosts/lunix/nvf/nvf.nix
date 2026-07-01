{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.nvf = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      inputs.nvf.nixosModules.default
      self.nixosModules.nvfOptions
      self.nixosModules.nvfKeymaps
      self.nixosModules.nvfAutocmds
      self.nixosModules.nvfPlugins
    ];
    programs.nvf = {
      enable = false;
      settings = {
        vim = {
          viAlias = true;
          vimAlias = true;
          lazy.enable = true;
        };
      };
    };
  };
}
