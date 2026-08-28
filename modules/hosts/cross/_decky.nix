  # modules/hosts/cross/_decky.nix

  { pkgs, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      gamescope-session = prev.gamescope-session.overrideAttrs (old: {
        postInstall = (old.postInstall or "") + ''
          substituteInPlace $out/lib/steamos/steam-launcher \
            --replace-fail \
            'steamargs=("-steamos3" "-gamepadui")' \
            'steamargs=("-steamos3" "-gamepadui" "-cef-enable-remote-debugging")'
        '';
      });
    })
  ];

  systemd.services.decky-loader = {
    path = [
      pkgs.python3
      pkgs.systemd
    ];
  };

  system.activationScripts.decky-compat = ''
    mkdir -p /usr/bin
    ln -sf /run/current-system/sw/bin/systemctl /usr/bin/systemctl
    ln -sf ${pkgs.python3}/bin/python3 /usr/bin/python3
  '';

  system.activationScripts.decky-cef-debugging = ''
    install -Dm644 /dev/null /home/ram/.local/share/Steam/.cef-enable-remote-debugging
    chown ram:users /home/ram/.local/share/Steam/.cef-enable-remote-debugging
  '';

}
