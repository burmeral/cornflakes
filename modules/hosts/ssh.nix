  # modules/environments/ssh/ssh.nix

  { lib, ... }:

let
  keys = {  # public, I'm not trying to parade my secrets across the internet
    koch  = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMqn6/QWX07gkCwqGOyNuFHXuhBd+mpQ3ro8NTgWbB9B koch";
    cross = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJJ1V0ioPl5bPv3w+GdjY1qONPh6MpXl7OxQLFofZyCB cross";
    sier  = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIITeq5bBJ26hYjwzFyClUJ5B2fogg3Fp37CoA5EMF3+s sier";
  };
  allKeys = lib.attrValues keys;
in
{
  flake.modules.nixos.ssh = { ... }: {
    services.openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
    users.users.ram.openssh.authorizedKeys.keys = allKeys;
    services.tailscale.enable = true;
  };
}
