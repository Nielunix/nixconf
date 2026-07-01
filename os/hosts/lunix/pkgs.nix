{...}: {
  flake.nixosModules.pkgs = {
    pkgs,
    inputs,
    ...
  }: {
    environment.systemPackages = with pkgs; [
      ripgrep
      xwayland-satellite
      brightnessctl
      fishPlugins.tide
      awww
      wl-clipboard

      #neovim dependencies
      gnumake
      unzip
      wget
      cargo
      ruby
      nodejs
      python3
      python313Packages.pip
      tree-sitter
      lua55Packages.tree-sitter-cli
      fd
      qt6.qtbase
      qt6.qtdeclarative
      qt6.qtlanguageserver
      go
      lua55Packages.luarocks
      julia

      cmatrix
      impala
      wiremix
      bluetui
    ];
  };
}
