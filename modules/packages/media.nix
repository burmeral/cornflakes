# modules/packages/media.nix
{ ... }:
  {
    flake.modules.nixos.media = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [

        # Recording
        obs-studio

        # Wayland screen capture for OBS
        obs-studio-plugins.wlrobs

        # Pipewire dependency
        obs-studio-plugins.obs-pipewire-audio-capture

        # Green screen
        obs-studio-plugins.obs-backgroundremoval  
      
        # Audio editing
        tenacity  

        # Video editing 
        kdePackages.kdenlive
     
      ];

      # OBS virtual camera
      boot.extraModulePackages = with pkgs.linuxPackages_latest; [
        v4l2loopback
      ];
      boot.kernelModules = [ "v4l2loopback" ];
      boot.extraModprobeConfig = ''
        options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
      '';
    };
  }
