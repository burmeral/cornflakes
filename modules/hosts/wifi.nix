  # modules/hosts/koch/wifi.nix

  { ... }:
{
  flake.modules.nixos.wifi = { pkgs, ... }: {

    environment.systemPackages = with pkgs; [
      impala
    ];

    networking.networkmanager.enable = true;
    networking.networkmanager.wifi.backend = "iwd";
    
    networking.wireless.enable = false;
    networking.useDHCP = false;

    # HM network waiter
    systemd.services = {
      hm-activate-ram = {
            wants = [ "network-online.target" ];
            after = [ "network-online.target" ];
          };
      NetworkManager-wait-online.enable = true;
    };
  };
}
