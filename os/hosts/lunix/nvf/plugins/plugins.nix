{self, ...}: {
  flake.nixosModules.nvfPlugins = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      self.nixosModules.nvfPluginsAutopairs
      self.nixosModules.nvfPluginsBlink
      self.nixosModules.nvfPluginsColorsheme
      self.nixosModules.nvfPluginsConform
      # self.nixosModules.nvfPluginsDebug #must add plugin manually
      self.nixosModules.nvfPluginsGessIndent
      self.nixosModules.nvfPluginsGitsigns
      # self.nixosModules.nvfPluginsIndentLine  #must add plugin manually
      self.nixosModules.nvfPluginsNeoGit
      self.nixosModules.nvfPluginsLint
      self.nixosModules.nvfPluginsLsp
      self.nixosModules.nvfPluginsMini
      self.nixosModules.nvfPluginsNeoTree
      self.nixosModules.nvfPluginsTelescope
      self.nixosModules.nvfPluginsTodo
      self.nixosModules.nvfPluginsTreesitter
      self.nixosModules.nvfPluginsWichkey
    ];
    programs.nvf.settings.vim = {
      startPlugins = [
        "plenary-nvim"
      ];
      #languages
      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;
        nix.enable = true;
        qml.enable = true;
        typescript.enable = true;
        json.enable = true;
        toml.enable = true;
      };
    };
  };
}
