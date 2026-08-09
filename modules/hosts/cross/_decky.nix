# modules/hosts/cross/_decky.nix

  { pkgs, ... }:
{
  jovian.decky-loader.enable = true;
  jovian.decky-loader.extraPackages = [ pkgs.systemd ];
}
