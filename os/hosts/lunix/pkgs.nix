{ ... }: {
  flake.nixosModules.pkgs =
    {
      pkgs,
      inputs,
      ...
    }:
    {
      environment.systemPackages = with pkgs; [
        ripgrep
        xwayland-satellite
        brightnessctl
        fishPlugins.tide
        awww
        wl-clipboard

        gnumake
        unzip
        wget
        cargo
        python3
        fd
        qt6.qtbase
        qt6.qtdeclarative
        qt6.qtlanguageserver

        deezer-desktop
        cmatrix
        impala
        wiremix
        bluetui

        gamescope

        heroic # install heroic launcher
        lutris # install lutris launcher
        protonup-qt # GUI for installing custom Proton versions like GE_Proton

        prismlauncher

        krita
        gimp
        blender
      ];
    };
}
