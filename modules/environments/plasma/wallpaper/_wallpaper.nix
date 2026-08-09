  # modules/environments/plasma/wallpaper/_wallpaper.nix

{ config, lib, pkgs, ... }:
let
  username = config.home.username;
  wallsync  = pkgs.writeShellScriptBin "wallsync"
    (builtins.replaceStrings [ "@USERNAME@" ] [ username ]
      (builtins.readFile ./_scripts/wallsync));
in {
  home.packages = [
    wallsync
    pkgs.qt6.qttools
    pkgs.dbus
    pkgs.inotify-tools
  ];

  home.file = {
    "Assets/Homescreen/.keep".text = "";
    "Assets/Lockscreen/.keep".text = "";
    "Assets/Greeter/.keep".text    = "";
  };

  systemd.user.services.wallsync = {
    Unit = {
      Description = "Synchronize Plasma wallpapers";
      After  = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      Type       = "simple";
      ExecStart  = "${wallsync}/bin/wallsync";
      Restart    = "on-failure";
      RestartSec = 5;
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
