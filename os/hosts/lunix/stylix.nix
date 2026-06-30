{ inputs, ... }: {
  flake.nixosModules.myStylix = { pkgs, ... }: {
    imports = [
      inputs.stylix.nixosModules.stylix
    ];
    stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";
    autoEnable = true;
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.caskaydia-mono;
        name = "CaskaydiaMono Nerd Font";
      };
      };
    };
  };
}
