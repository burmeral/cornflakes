  # modules/environments/plasma/wallpaper/_screen.nix

  { pkgs, ... }:

{
  home.packages = [ pkgs.kdePackages.libkscreen ];

   systemd.user.services.kscreen-configure = {
    Unit = {
      Description = "Configure three-monitor layout";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStartPre = "${pkgs.coreutils}/bin/sleep 5";
      ExecStart = pkgs.writeShellScript "kscreen-configure" ''
        ${pkgs.kdePackages.libkscreen}/bin/kscreen-doctor \
          output.DP-1.enable \
          output.DP-1.mode.1920x1080@60 \
          output.DP-1.scale.1 \
          output.DP-1.rotation.right \
          output.DP-1.position.0,0 \
          output.HDMI-A-1.enable \
          output.HDMI-A-1.mode.3440x1440@84.96 \
          output.HDMI-A-1.scale.1.1 \
          output.HDMI-A-1.position.1080,521 \
          output.HDMI-A-1.rgbrange.Full \
          output.eDP-1.enable \
          output.eDP-1.mode.1920x1200@60 \
          output.eDP-1.scale.1.25 \
          output.eDP-1.position.4208,521
      '';
      RemainAfterExit = true;
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
