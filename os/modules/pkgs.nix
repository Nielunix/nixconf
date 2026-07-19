{ pkgs, lib, inputs, ... }: {
  flake.homeModules.pkgs = { pkgs, ... }: {
    home.packages = with pkgs; [
      hello
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
      inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
      inputs.qml-niri.packages.${pkgs.stdenv.hostPlatform.system}.default

      cmatrix
      fastfetch
      zoxide
      vesktop
      eza
      rofi
    ];
  };
}
