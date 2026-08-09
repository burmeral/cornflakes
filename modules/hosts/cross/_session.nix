  # modules/hosts/cross/_session.nix

  { pkgs, ... }:
{
  systemd.services.display-manager.serviceConfig.ExecStartPre = [
    "-${pkgs.coreutils}/bin/rm /etc/sddm.conf.d/zzt-steamos-temp-login.conf"
    "-${pkgs.coreutils}/bin/rm /etc/sddm.conf.d/zzt-holo-temp-login.conf"
  ];
  system.activationScripts.remove-holo-temp-login = ''
      rm -f /etc/sddm.conf.d/zzt-holo-temp-login.conf
      rm -f /etc/sddm.conf.d/zzt-steamos-temp-login.conf
  '';
}
