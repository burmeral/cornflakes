  # modules/environments/plasma/_imports.nix

  { pkgs, ... }:

{
  imports = [
    ./plugins/_wavetask.nix
    ./plugins/_fonts.nix
    ./wallpaper/_wallpaper.nix
  # ./wallpaper/_screen.nix
  ];
}
