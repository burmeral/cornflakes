  # modules/users/ram/_inf.nix

  { inputs, pkgs, ... }:
let
  infiniteDesktop =
    inputs.self.packages.${pkgs.system}.hyprland-infinite-desktop;
in
{
  home.packages = [
    infiniteDesktop
  ];

  systemd.user.services.infinite-desktop = {
    Unit = {
      Description = "Hyprland Infinite Desktop";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${infiniteDesktop}/bin/infinite-desktop";
      Restart = "on-failure";
      RestartSec = 2;
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
