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
    ./_audacious.nix
    ./_spicetify.nix
    ./_browser.nix
    # ./_zen.nix
    ./_herdr.nix
    ./_otter.nix
    ./_colors.nix
    ./_inf.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    vesktop
    obsidian
    anki-bin
    grayjay
  ];

  # cursor
  home.pointerCursor = {
    enable = true;
    name = "macOS";
    package = pkgs.apple-cursor;
    size = 28;
    gtk.enable = true;
  };

  gtk.cursorTheme = {
    name = "macOS";
    package = pkgs.apple-cursor;
    size = 28;
  };

  # easyeffects
  # services.easyeffects = {
  #   enable = true;
  # };
}
