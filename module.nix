{ inputs, hostModule }:
{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.spotify-xfeusw;

  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};

  ext = dir: file: {
    src = dir;
    name = file;
  };

  dynamicTheme = inputs.dynamic-theme;

  themeSrc = pkgs.runCommand "default-dynamic-theme" { } ''
    mkdir -p "$out"
    cp ${dynamicTheme}/color.ini "$out/color.ini"
    cp ${dynamicTheme}/user.css "$out/user.css"
  '';

  defaultDynamicExtension = pkgs.runCommand "default-dynamic-extension" { } ''
    mkdir -p "$out"
    cp ${dynamicTheme}/default-dynamic.js "$out/default-dynamic.js"
  '';

  vibrantExtension = pkgs.runCommand "vibrant-extension" { } ''
    mkdir -p "$out"
    cp ${dynamicTheme}/Vibrant.min.js "$out/Vibrant.min.js"
  '';
in
{
  imports = [ hostModule ];

  options.spotify-xfeusw.enable = lib.mkEnableOption "xfeusw's spicetify setup (DefaultDynamic theme, extensions, custom apps, snippets)";

  config = lib.mkIf cfg.enable {
    programs.spicetify = {
      enable = true;

      theme = {
        name = "DefaultDynamic";
        src = themeSrc;
        injectCss = true;
        replaceColors = true;
      };
      colorScheme = lib.mkDefault "Dark-Base";

      enabledExtensions =
        (with spicePkgs.extensions; [
          bookmark
          trashbin
          songStats
          fullAlbumDate
          featureShuffle
          writeify
          wikify
          playlistIntersection
          playlistIcons
          copyLyrics
          aiBandBlocker
        ])
        ++ [
          {
            name = "default-dynamic.js";
            src = defaultDynamicExtension;
          }
          {
            name = "Vibrant.min.js";
            src = vibrantExtension;
          }

          (ext "${inputs.spicetify-ohitstom}/immersiveView" "immersiveView.js")
          (ext "${inputs.spicetify-ohitstom}/npvAmbience" "npvAmbience.js")
          (ext "${inputs.spicetify-konsl}/find-duplicates/dist" "find-duplicates.js")
          (ext "${inputs.spicetify-konsl}/playback-bar-waveform/dist" "playback-bar-waveform.js")
          (ext "${inputs.spicetify-dj-info}/dist" "djinfo.mjs")
          (ext "${inputs.spicetify-genres}/dist" "whatsThatGenre.js")
          (ext inputs.spicetify-anonymized-radios "AnonymizedRadios.js")
          (ext "${inputs.spicetify-kamiloo}/extensions/more-lyrics/dist" "more-lyrics.js")
          (ext inputs.spicetify-lyric-miniplayer "lyrics-overlay.js")
        ];

      enabledCustomApps = (with spicePkgs.apps; [ marketplace ]) ++ [
        {
          name = "listening-stats";
          src = inputs.spicetify-listening-stats;
        }
        {
          name = "better-local-files";
          src = inputs.spicetify-better-local-files;
        }
      ];

      enabledSnippets = import ./snippets.nix;
    };
  };
}
