  # modules/hosts/bluetooth.nix

  { pkgs, ... }:
{
  flake.modules.nixos.bluetooth = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      bluetui
    ];

    hardware = {
      bluetooth.enable = true;
      bluetooth.powerOnBoot = true;
      bluetooth.settings = {
        General = {
          Enable = "Source,Sink,Media"; 
        };
      };
    };
  };
}
