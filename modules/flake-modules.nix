  # modules/flake-modules.nix

  { lib, ... }:
{
  options.flake.modules.nixos = lib.mkOption {
    type = lib.types.attrsOf lib.types.unspecified;
    default = {};
  };
}
