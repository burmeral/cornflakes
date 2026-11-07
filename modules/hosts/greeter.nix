  # /modules/hosts/greeter.nix

  { ... }:
{
  flake.modules.nixos.greeter = { ... }: {
    services.displayManager.ly = {
      enable = true;
      x11Support = false;  
    };
  };
}
