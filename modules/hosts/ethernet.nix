  # modules/hosts/sier/ethernet.nix

  { ... }:
{
  flake.modules.nixos.ethernet = { ... }: {

    # NetworkManager 
    networking.networkmanager.enable = true;
  };
}
