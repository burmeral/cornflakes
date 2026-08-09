  # modules/packages/music.nix

{ ... }:
  {
    flake.modules.nixos.music = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [

      # daw
      # reaper

      # formater
      ffmpeg

      # rippers
      spotdl
      yt-dlp

      # taggers
      beets
      kid3

    ];
  };
}
