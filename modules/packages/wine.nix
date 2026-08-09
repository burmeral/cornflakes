  # modules/packages/wine.nix

  { ... }:
{
  flake.modules.nixos.wine = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      wine
      winetricks
      bottles
    ];
  };
}
