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
        appimage-run
        fishPlugins.tide
        awww
        wl-clipboard
        cava
        libreoffice
        btop
        
        qt6Packages.qtstyleplugin-kvantum
        polkit

        gnome-boxes
        android-tools
        wineWow64Packages.stable
        winetricks
        swaylock
        swayidle

        libimobiledevice
        gnumake
        unzip
        wget
        cargo
        localsend
        python3
        fd
        qt6.qtbase
        qt6.qtdeclarative
        qt6.qtlanguageserver

        kitty
        yazi
        kdePackages.dolphin
        kdePackages.ark
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
        hyprpolkitagent

        krita
        gimp
        blender
        google-cursor
        btop

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
