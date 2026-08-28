  # modules/packages/emulation.nix

  { inputs, ... }:
{
  flake.modules.nixos.emulation = { pkgs, ... }: {

    environment.systemPackages = with pkgs; [
      # GameCube/Wii
      dolphin-emu

      # Wii U
      cemu

      # 3DS
      azahar

      # PlayStation 2
      pcsx2

      # PlayStation 3
      rpcs3

      # Multi-system frontend
      retroarch-full
    ];

    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;
  };
}
