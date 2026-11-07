  # modules/packages/eng.nix

  { ... }:
{
  flake.modules.nixos.eng = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      freecad
      openscad
      kicad
      arduino-ide
      graphviz
    ];
  };
}
