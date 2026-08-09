  # modules/users/uri/_imports.nix

{ config, pkgs, ... }:

  let username = "uri"; in
{
  imports = [

  # user apps
    ./_zen.nix

  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    vesktop
    obsidian
  ];
}
