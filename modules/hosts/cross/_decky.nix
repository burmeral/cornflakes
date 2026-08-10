  # modules/hosts/cross/_decky.nix

  { pkgs, ... }:

let
  plugin_loader = pkgs.buildFHSEnv {
    name = "PluginLoader";
    targetPkgs = p: with p; [ zlib coreutils curl unzip pulseaudio systemd ];
    runScript = "/home/ram/homebrew/services/PluginLoader";
  };
in
{
  jovian.decky-loader.enable = false;
  systemd.services.decky-loader = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    environment.PLUGIN_PATH = "/home/ram/homebrew/plugins";
    serviceConfig = {
      Type = "simple";
      User = "root";
      Restart = "always";
      ExecStart = "${plugin_loader}/bin/PluginLoader";
      WorkingDirectory = "/home/ram/homebrew/services";
      KillSignal = "SIGKILL";
    };
  };
}
