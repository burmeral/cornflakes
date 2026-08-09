  # modules/hosts/cross/cross.nix

  { config, inputs, ... }:
{
  flake.nixosConfigurations.cross = inputs.nixpkgs.lib.nixosSystem {

    specialArgs = {
      inherit inputs;
      inherit (inputs.nixpkgs) lib;
    };

    modules = with config.flake.modules.nixos; [

      # host
      ./_hardware-configuration.nix
      boot
      ./_session.nix
 
      # jovian
      inputs.jovian.nixosModules.default
      ./_decky.nix

      { 
        networking.hostName = "cross";
        system.stateVersion = "25.11";

        jovian = {
          devices.steamdeck.enable = true;
          devices.steamdeck.enableGyroDsuService = true;
          steam = {
            enable = true;
            autoStart = true;
            user = "ram";
            desktopSession = "hyprland";
          };
        };
      }

      # disko
      ./_disko.nix
      inputs.disko.nixosModules.disko

      # home manager
      inputs.home-manager.nixosModules.default

      # necesities
      users
      store
      audio           
      bluetooth
      wifi 
      print
      portable
      intl

      # desktop environments
      hypr

      # fonts
      applefonts
      # gallant

      # cloud sync
      syncthing 

      # packages
      terminal
      reader
      nvim

      # media tools
      # media
      # music

      # games
      steam
      minecraft
      emulation

      # alt software
      # wine
      # waydroid

    ];
  };
}
