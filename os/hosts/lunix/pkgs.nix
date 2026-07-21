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
        tree
        fishPlugins.tide
        awww
        wl-clipboard
        cava
        libreoffice
        btop
        
        qt6Packages.qtstyleplugin-kvantum
        polkit

        playerctl
        libnotify
        gnome-boxes
        android-tools
        wallust
        wineWow64Packages.stable
        winetricks
        swaylock
        swayidle

        libimobiledevice
        gnumake
        fetch
        unzip
        wget
        cargo
        localsend
        python3
        fd

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

        hyprpicker
        hyprshot
        hyprshutdown
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
