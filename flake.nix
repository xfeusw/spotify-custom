{
  description = "Spicetify setup: spicetify-nix + theme, extensions, apps, snippets";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dynamic-theme = {
      url = "github:BotAlejandro/spicetify-dynamic-theme/df61a24dada0e2d8f6e4c97bf0daaa3770ba0dc4";
      flake = false;
    };

    spicetify-ohitstom = {
      url = "github:ohitstom/spicetify-extensions";
      flake = false;
    };
    spicetify-konsl = {
      url = "github:Konsl/spicetify-extensions";
      flake = false;
    };
    spicetify-dj-info = {
      url = "github:L3-N0X/spicetify-dj-info";
      flake = false;
    };
    spicetify-listening-stats = {
      url = "github:HeadshotInteractive/listening-stats?ref=dist";
      flake = false;
    };
    spicetify-better-local-files = {
      url = "github:Pithaya/spicetify-apps-dist?ref=dist/better-local-files";
      flake = false;
    };
    spicetify-genres = {
      url = "github:LucasOe/spicetify-genres";
      flake = false;
    };
    spicetify-anonymized-radios = {
      url = "github:BitesizedLion/AnonymizedRadios";
      flake = false;
    };
    spicetify-kamiloo = {
      url = "github:Kamiloo13/spicetify-extensions";
      flake = false;
    };
    spicetify-lyric-miniplayer = {
      url = "github:FO-SS/Spictify-Lyric-Miniplayer";
      flake = false;
    };
  };

  outputs =
    { spicetify-nix, ... }@inputs:
    let
      mkModule = hostModule: import ./module.nix { inherit inputs hostModule; };
    in
    {
      nixosModules.default = mkModule spicetify-nix.nixosModules.default;
      homeManagerModules.default = mkModule spicetify-nix.homeManagerModules.default;
    };
}
