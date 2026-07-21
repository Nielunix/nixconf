{
  self,
  inputs,
  ...
}:
{
  flake.nixosModules.lunix =
    {
      pkgs,
      lib,
      ...
    }: let
      hyprdrivers =inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
      imports = [
        self.nixosModules.lunixHardwareScan
        # self.nixosModules.niri
        self.nixosModules.sddm
        self.nixosModules.neovim
        self.nixosModules.nh
        self.nixosModules.programs
        self.nixosModules.services
        # self.nixosModules.myStylix
        self.nixosModules.pkgs
        inputs.home-manager.nixosModules.default
      ];

      nix.settings = {
        substituters = [ "https://hyprland.cachix.org" ];
        trusted-substituters = [ "https://hyprland.cachix.org" ];
        trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
        # Required so non-root users are allowed to use the above substituter/keys.
        # Use @wheel for all sudo users, or list your username explicitly.
        trusted-users = [
          "root"
          "@wheel"
        ];
      };

      xdg.portal.enable = true;
      xdg.portal.extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      boot = {
        #Bootloader
        loader.systemd-boot.enable = true;
        loader.efi.canTouchEfiVariables = true;

        #plymouth
        plymouth = {
          enable = true;
          theme = lib.mkForce "fade-in";
        };

        # Enable "Silent boot"
        consoleLogLevel = 3;
        initrd.verbose = false;
        kernelParams = [
          "quiet"
          "rd.udev.log_level=3"
          "rd.systemd.show_status=auto"
          "i915.enable_guc=3"
        ];

        # Hide the OS choice for bootloaders.
        # It's still possible to open the bootloader list by pressing any key
        # It will just not appear on screen unless a key is pressed
        loader.timeout = 0;
      };

      networking.hostName = "dreanke"; # Define your hostname.
      # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

      # networking.dhcpcd.enable = true;
      #
      networking.networkmanager.enable = true;
      # # networking.networkmanager.wifi.backend = "iwd";
      # # networking.wireless.iwd.enable = true;
      # networking.wireless.iwd.settings = {
      #   IPv6 = {
      #     Enabled = true;
      #   };
      #   Settings = {
      #     AutoConnect = true;
      #   };
      # };

      time.timeZone = "Europe/Paris";

      i18n.defaultLocale = "en_US.UTF-8";

      i18n.extraLocaleSettings = {
        LC_ADDRESS = "fr_FR.UTF-8";
        LC_IDENTIFICATION = "fr_FR.UTF-8";
        LC_MEASUREMENT = "fr_FR.UTF-8";
        LC_MONETARY = "fr_FR.UTF-8";
        LC_NAME = "fr_FR.UTF-8";
        LC_NUMERIC = "fr_FR.UTF-8";
        LC_PAPER = "fr_FR.UTF-8";
        LC_TELEPHONE = "fr_FR.UTF-8";
        LC_TIME = "fr_FR.UTF-8";
      };

      security.rtkit.enable = true;

      users.users."lunix" = {
        shell = pkgs.zsh;
        isNormalUser = true;
        description = "Lunix";
        extraGroups = [
          "networkmanager"
          "wheel"
          "adbusers"
        ];
      };

      home-manager = {
        backupFileExtension = "back";
        users.lunix = {
          imports = [ self.homeModules.lunixHome ];
        };
      };
      # Allow unfree packages
      nixpkgs.config.allowUnfree = true;

      #bluetooth
      hardware.bluetooth = {
        enable = true;
        powerOnBoot = false;
      };
      
      hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
          # Required for modern Intel GPUs (Xe iGPU and ARC)
          intel-media-driver # VA-API (iHD) userspace
          vpl-gpu-rt # oneVPL (QSV) runtime
          intel-compute-runtime # OpenCL (NEO) + Level Zero for Arc/Xe
          hyprdrivers.mesa
        ];

        enable32Bit = true;
        package32 = hyprdrivers.pkgsi686Linux.mesa;
      };

      environment.sessionVariables = {
        LIBVA_DRIVER_NAME = "iHD"; # Prefer the modern iHD backend
      };
      hardware.enableRedistributableFirmware = true;

      # WARNING: Do not Change
      system.stateVersion = "26.05"; # Did you read the comment?
    };
}
