{ ... }: {
  flake.nixosModules.services = { ... }: {
    services.flatpak.enable = true;
    services.upower.enable = true;
    services.xserver.enable = true;



    services.xserver.xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
    services.printing.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    services.libinput.enable = true;

    services.gvfs.enable = true;
  };
}
