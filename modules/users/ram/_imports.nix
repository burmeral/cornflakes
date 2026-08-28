  # modules/users/ram/_imports.nix

{ inputs, config, pkgs, ... }:

  let username = "ram"; in
{
  imports = [

  # terminal
    ./_shell.nix

  # environment packages
  # ../../environments/sddm/_imports.nix
    ../../environments/plasma/_imports.nix

  # user apps
    ./_ryubin.nix
    ./_audacious.nix
    ./_spicetify.nix
    ./_zen.nix
    ./_colors.nix
    ./_inf.nix
    ./_otter.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    vesktop
    obsidian
    anki-bin
  ];

  # cursor
  home.pointerCursor = {
    enable = true;
    name = "Apple";
    package = pkgs.apple-cursor;
    size = 24;
    gtk.enable = true;
  };

  # easyeffects
  # services.easyeffects = {
  #   enable = true;
  # };
}
