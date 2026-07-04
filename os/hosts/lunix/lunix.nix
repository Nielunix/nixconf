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
    }:
    {
      imports = [
        self.nixosModules.lunixHardwareScan
        # self.nixosModules.niri
        self.nixosModules.neovim
        self.nixosModules.nh
        self.nixosModules.programs
        self.nixosModules.services
        self.nixosModules.myStylix
        self.nixosModules.pkgs
        inputs.home-manager.nixosModules.default
      ];

      xdg.portal.enable = true;
      xdg.portal.extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      # Bootloader.
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      networking.hostName = "dreanke"; # Define your hostname.
      # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

      networking.networkmanager.enable = true;

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
        shell = pkgs.fish;
        isNormalUser = true;
        description = "Lunix";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        packages = with pkgs; [
          #  thunderbird
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

       services.xserver.videoDrivers = [ "modesetting" ];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      # Required for modern Intel GPUs (Xe iGPU and ARC)
      intel-media-driver     # VA-API (iHD) userspace
      vpl-gpu-rt             # oneVPL (QSV) runtime
      intel-compute-runtime  # OpenCL (NEO) + Level Zero for Arc/Xe
      # libvdpau-va-gl       # Only if you must run VDPAU-only apps
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";     # Prefer the modern iHD backend
    # VDPAU_DRIVER = "va_gl";      # Only if using libvdpau-va-gl
  };
  hardware.enableRedistributableFirmware = true;
  boot.kernelParams = [ "i915.enable_guc=3" ];

      # WARNING: Do not Change
      system.stateVersion = "26.05"; # Did you read the comment?
    };
}
