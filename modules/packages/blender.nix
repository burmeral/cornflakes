  # modules/packages/blender.nix

{ ... }:
  {
    flake.modules.nixos.blender = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        unityhub
        blender
      ];

    };
  }
