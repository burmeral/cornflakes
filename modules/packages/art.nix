  # modules/packages/art.nix

  { ... }:
{
  flake.modules.nixos.art = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
     inkscape-with-extensions
     krita
    ];
  };
}
