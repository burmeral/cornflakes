  # modules/users/ram/_spicetify.nix 

  { inputs, pkgs, config, lib, ... }:
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  # spicetify
  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    enable = true;
    spotifyPackage = pkgs.spotify;
    enabledCustomApps = with spicePkgs.apps; [
      marketplace           # pretty themes :)
      historyInSidebar      # self explanatory
      lyricsPlus
      {
        src = pkgs.fetchFromGitHub {
          owner = "ivLis-Studio";
          repo = "ivLyrics";
          rev = "main";
          hash = "sha256-KPEeZEAZ6UXVZDmhPI3uQeF2OmWzjXf/dQOwVlKmLRM=";
        };
        name = "ivLyrics";
      }
    ];

    enabledExtensions = with spicePkgs.extensions; [
      adblock               # adblockify
      wikify                # wikify
      listPlaylistsWithSong # list playlists with songs
      volumePercentage      # volume percentage
      shuffle               # shuffle+
      playlistIcons         # playlist icons
      # betterGenres          # better spotify genres
      lastfm                # lastfm stats
      aiBandBlocker         # ai band blocker
      romajiConvert         # convert japanese
      hidePodcasts          # hide podcasts
      pinnedSidebarPanel    # queue top side panel
    ];

#    theme = {
#      name = "Appletify";
#      src = pkgs.fetchFromGitHub {
#        owner = "raysin1";
#        repo = "Appletify";
#        rev = "d9bbd3ee9c01978a266f861561e46d86eadaf9cb";
#        hash = "sha256-TwJ0++sq6vPWCRbbE42gYRMm8G98esNkPQTDkN4Z2g4=";
#      };
#      injectCss = true;
#      injectThemeJs = true;
#      replaceColors = true;
#      homeConfig = true;
#      overwriteAssets = false;
#    };

     theme = {
     name = "marketplace";
     src = pkgs.fetchFromGitHub {
       owner = "spicetify";
       repo = "spicetify-marketplace";
       rev = "main";
       hash = "sha256-Pymokvth/mCzct451x+5fJO2BcHiflkF1cJcIW+0XqY=";
     };
     injectCss = true;
     replaceColors = false;
     overwriteAssets = false;
     homeConfig = false;
    };
  };
}
