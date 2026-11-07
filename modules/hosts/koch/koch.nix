  # modules/hosts/koch/koch.nix

  { config, inputs, ... }:
{
  flake.nixosConfigurations.koch = inputs.nixpkgs.lib.nixosSystem {

    specialArgs = {
      inherit inputs;
      inherit (inputs.nixpkgs) lib;
    };

    modules = with config.flake.modules.nixos; [

      # host
      ./_hardware-configuration.nix
      boot

      { 
        networking.hostName = "koch";
        system.stateVersion = "25.11";
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
      audiofix
      bluetooth
      wifi 
      print
      intl
      portable
      greeter

      # desktop environments
      hypr
      plasma

      # fonts
      applefonts
      # gallant

      # cloud sync
      syncthing 
      ssh

      # sandbox
      vm
      eng

      # utilities
      terminal
      nvim
      reader

      # media tools
      art
      media
      music

      # games
      steam
      minecraft

      # alt software
      # wine
      # waydroid

    ];
  };
}
