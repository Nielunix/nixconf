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

      # WARNING: Do not Change
      system.stateVersion = "26.05"; # Did you read the comment?
    };
}
