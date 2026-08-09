  # modules/packages/emulation.nix

  { inputs, ... }:
{
  flake.modules.nixos.emulation = { pkgs, ... }: {

    environment.systemPackages = with pkgs; [
      # GameCube/Wii
      dolphin-emu

      # PlayStation 2
      pcsx2

      # PlayStation 3
      rpcs3

      # 3DS
      azahar

      # Multi-system frontend
      retroarch-full
    ];

    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;
  };
}
