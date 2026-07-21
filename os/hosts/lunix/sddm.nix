{ ... }: {
  flake.nixosModules.sddm =
    { pkgs, ... }:
    let
      sddm-astronaut = (
        pkgs.sddm-astronaut.override {
          embeddedTheme = "hyprland_kath"; # or any other theme
          # themeConfig = {
          # Customize colors and settings
          # HeaderTextColor = "#d5c4a1";
          # Background = "Backgrounds/your-custom-background.png";
          # ... other theme configuration options
        }
      );
    in
    {
      environment.systemPackages = [ sddm-astronaut ];

      services.displayManager.sddm = {
        enable = true;
        package = pkgs.kdePackages.sddm;
        enableHidpi = true;
        extraPackages = with pkgs; [
          kdePackages.qtmultimedia # Required for video backgrounds/audio
        ];
        theme = "sddm-astronaut-theme";
        settings = {
          
        };
      };
    };
}
