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
      url = "github:ohitstom/spicetify-extensions/ec0013fffb394f50740a0e3d6f590eb3bd752602";
      flake = false;
    };
    spicetify-konsl = {
      url = "github:Konsl/spicetify-extensions/db60731ca9b31adf55c50ff64c83bb2f13d87765";
      flake = false;
    };
    spicetify-dj-info = {
      url = "github:L3-N0X/spicetify-dj-info/48beac8d5b4e5d2dcbbac6cd4910d4ed10b5387e";
      flake = false;
    };
    spicetify-listening-stats = {
      url = "github:HeadshotInteractive/listening-stats/76eb591422d81e8a4de5fc70cd81476c88d27fcc";
      flake = false;
    };
    spicetify-better-local-files = {
      url = "github:Pithaya/spicetify-apps-dist/bf467fab93e6c1f8b8d4189dc1054bd1cafb3f3a";
      flake = false;
    };
    spicetify-genres = {
      url = "github:LucasOe/spicetify-genres/59dd0e75e2dce5da4c525ebed22eb43ab19f3ba3";
      flake = false;
    };
    spicetify-anonymized-radios = {
      url = "github:BitesizedLion/AnonymizedRadios/1c843dcb0a7b43da9932ee1cc9b3557f0a7f8ba6";
      flake = false;
    };
    spicetify-kamiloo = {
      url = "github:Kamiloo13/spicetify-extensions/8a9cdd355aeac8895884b544de08efe2ccfc0cb4";
      flake = false;
    };
    spicetify-lyric-miniplayer = {
      url = "github:FO-SS/Spictify-Lyric-Miniplayer/d96a946a7de97f6fe48051a3798bef2d485967f6";
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
