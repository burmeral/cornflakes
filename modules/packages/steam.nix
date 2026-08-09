  # modules/packages/steam.nix
  
  { ... }:
{
  flake.modules.nixos.steam = { pkgs, ... }: {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = false;
      gamescopeSession.enable = true;
    };

    # Packages
    environment.systemPackages = with pkgs; [
      gamemode
      steam-rom-manager
    ];

    # Steam hardware acceleration
    hardware.graphics = {
      enable = true;
      enable32Bit = true; 
    };

    # Compatibility tools
    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/ram/.steam/root/compatibilitytools.d";
    };
  };
}
