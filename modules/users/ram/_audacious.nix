  # modules/users/ram/_audacious.nix

{ pkgs, ... }:

let
  audaciousWrapped = pkgs.symlinkJoin {
    name = "audacious-x11";

    paths = [ pkgs.audacious ];

    nativeBuildInputs = [ pkgs.makeWrapper ];

    postBuild = ''
      wrapProgram $out/bin/audacious \
        --set QT_QPA_PLATFORM xcb \
        --set GDK_BACKEND x11
    '';
  };
in {
  home.packages = [
    audaciousWrapped
  ];
}
