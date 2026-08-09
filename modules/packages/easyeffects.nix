  # modules/packages/easyeffects.nix

  { ... }:
{
  flake.modules.nixos.easyeffects = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      easyeffects
      lsp-plugins
      calf
      mda_lv2
      zam-plugins
      dragonfly-reverb
      eq10q
    ];
    # Required for EasyEffects plugin discovery
    programs.dconf.enable = true;
  };
}
