  # modules/packages/music.nix

{ ... }:
  {
    flake.modules.nixos.music = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [

      # daw
      # reaper

      # services
      mpd
      mpc

      # players

      # rmpc
      cmus
      cmusfm

      # formater
      ffmpeg

      # rippers
      spotdl
      yt-dlp

      # taggers
      beets
      kid3

    ];

    # mpd
    services.mpd = {
      enable = true;
      user = "ram";
      settings = {
        music_directory = "/home/ram/Music";
      };
    };
  };
}
