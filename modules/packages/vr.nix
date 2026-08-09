  # modules/packages/vr.nix

{ ... }:
  {
    flake.modules.nixos.vr = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        alvr
        android-tools
      ];

      # Required for ALVR
      services.pipewire.enable = true; # already in audio.nix, harmless duplicate
    
      # Firewall ports for ALVR streaming
      networking.firewall = {
        allowedTCPPorts = [ 9943 9944 ];
        allowedUDPPorts = [ 9943 9944 ];
      };

      # Better streaming performance
      boot.kernelModules = [ "v4l2loopback" ]; # already in media.nix
    };
  }
