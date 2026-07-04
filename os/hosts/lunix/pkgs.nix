{ inputs, ... }: {
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
        cava

        swaylock
        swayidle
        
        libimobiledevice
        gnumake
        unzip
        wget
        cargo
        python3
        fd
        qt6.qtbase
        qt6.qtdeclarative
        qt6.qtlanguageserver

        nautilus
        deezer-desktop
        cmatrix
        impala
        wiremix
        bluetui

        gamescope

        heroic # install heroic launcher
        lutris # install lutris launcher
        protonup-qt # GUI for installing custom Proton versions like GE_Proton
        ckan

        prismlauncher

        krita
        gimp
        blender

      ];
      fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        liberation_ttf
        fira-code
        fira-code-symbols
        mplus-outline-fonts.githubRelease
        dina-font
        proggyfonts
        nerd-fonts.jetbrains-mono
        nerd-fonts.caskaydia-mono
        nerd-fonts.caskaydia-cove
      ];
    };
}
