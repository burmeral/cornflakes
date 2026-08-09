  # modules/environments/sddm/sddm.nix

  { ... }:
{
  flake.modules.nixos.sddm = { config, pkgs, ... }:
  let
    cfg    = config.ram.sddm;
    sonoma = pkgs.callPackage ./themes/_sonoma.nix { };

    wallsync-sddm = pkgs.writeShellScriptBin "wallsync-sddm"
      (builtins.replaceStrings [ "@USERNAME@" ] [ cfg.greeterUser ]
        (builtins.readFile ./_scripts/wallsync-sddm));
  in {

    services.displayManager.sddm = {
      enable         = true;
      wayland.enable = true;
      theme          = "Sonoma";
      extraPackages  = [ sonoma ];
    };

    environment.systemPackages = [ sonoma wallsync-sddm ];

    systemd.paths.wallsync-sddm = {
      description = "Watch greeter wallpaper for SDDM";
      wantedBy    = [ "multi-user.target" ];
      pathConfig  = {
        PathChanged = "/home/${cfg.greeterUser}/Assets/Greeter/current.jpg";
        Unit        = "wallsync-sddm.service";
      };
    };

    systemd.services.wallsync-sddm = {
      description   = "Copy greeter wallpaper into SDDM";
      serviceConfig = {
        Type           = "oneshot";
        ExecStart      = "${wallsync-sddm}/bin/wallsync-sddm";
        StandardOutput = "journal";
        StandardError  = "journal";
      };
    };
  };
}
