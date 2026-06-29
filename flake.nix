{
  description = "Some random flake :3";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; #unstable
    nixpkgs-stable.url = "github:nixos/nixpkgs/26.05"; #stable 

    flake-parts.url = "github:hercules-ci/flake-parts"; #nice structure
    import-tree.url = "github:vic/import-tree"; #nice structure

    #home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules"; # wrapper


    #cool programs

    #zen-browser
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #stylix
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

    # import every .nix file in this and child directories exept flake.nix
    outputs = inputs: let
    inherit (inputs.nixpkgs) lib;
    inherit (lib.fileset) toList fileFilter;

    isNixModule = file:
      file.hasExt "nix"
      && file.name != "flake.nix"
      && !lib.hasPrefix "_" file.name;

    importTree = path:
      toList (fileFilter isNixModule path);

    mkFlake = inputs.flake-parts.lib.mkFlake {inherit inputs;};
  in
    mkFlake {imports = importTree ./.;};
}
