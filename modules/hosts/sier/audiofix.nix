  # modules/hosts/sier/audiofix.nix  

  { ... }:
{
  flake.modules.nixos.audiofix = { ... }: {

  # Disable monitor sinks
    environment.etc = {
  "wireplumber/wireplumber.conf.d/51-lower-hdmi-priority.conf".text = ''
    monitor.alsa.rules = [
      {
        matches = [
          { node.name = "alsa_output.pci-0000_03_00.1.hdmi-stereo" }
        ]
        actions = {
          update-props = {
            priority.session = 1
            priority.driver = 1
          }
        }
      }
    ]
  '';
};

  # Fix bluez behavior
    services.pipewire.wireplumber.enable = true;

    services.pipewire.wireplumber.extraConfig = {
      "10-bluetooth.conf" = {
        "monitor.bluez.properties" = {
          "bluez5.roles" = [ "a2dp_sink" ];
        };
      };
    };
  };
}
