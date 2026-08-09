  # modules/packages/waydroid.nix

{ ... }:
  {
    flake.modules.nixos.waydroid = { ... }: {
      virtualisation.waydroid.enable = true;
    };
  }
