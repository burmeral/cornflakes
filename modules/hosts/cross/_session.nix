  # modules/hosts/cross/_session.nix

  { lib, config, pkgs, ... }:
{
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  systemd.services.display-manager.serviceConfig.ExecStartPre = [
    "-${pkgs.coreutils}/bin/rm /etc/sddm.conf.d/zzt-steamos-temp-login.conf"
    "-${pkgs.coreutils}/bin/rm /etc/sddm.conf.d/zzt-holo-temp-login.conf"
  ];

  # Remove temporary session file to allow gamescope to boot first
  system.activationScripts.remove-holo-temp-login = ''
    rm -f /etc/sddm.conf.d/zzt-holo-temp-login.conf
    rm -f /etc/sddm.conf.d/zzt-steamos-temp-login.conf
  '';

}
