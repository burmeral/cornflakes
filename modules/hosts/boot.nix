  # modules/hosts/koch/boot.nix

  { ... }:
{
  flake.modules.nixos.boot = { pkgs, ... }: {

    # Bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Use latest kernel
    boot.kernelPackages = pkgs.linuxPackages_latest;
  };
}
