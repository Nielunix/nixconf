{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.lunix = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      self.nixosModules.lunixHardwareScan
      # self.nixosModules.niri
      self.nixosModules.neovim
      self.nixosModules.nh
      self.nixosModules.programs
      self.nixosModules.services
      self.nixosModules.myStylix
      self.nixosModules.nvf
      self.nixosModules.pkgs
      inputs.home-manager.nixosModules.default
    ];

    nix.settings.experimental-features = ["nix-command" "flakes"];
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

    services.xserver.enable = true;

    services.displayManager.ly.enable = true;

    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    services.libinput.enable = true;

    users.users."lunix" = {
      shell = pkgs.fish;
      isNormalUser = true;
      description = "Lunix";
      extraGroups = ["networkmanager" "wheel"];
      packages = with pkgs; [
        #  thunderbird
      ];
    };

    home-manager = {
      backupFileExtension = "back";
      users.lunix = {
        imports = [self.homeModules.lunixHome];
      };
    };
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    #bluetooth
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;
    };

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "26.05"; # Did you read the comment?
  };
}
