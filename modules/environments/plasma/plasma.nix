  # modules/environments/plasma/plasma.nix

  { ... }:
{
  flake.modules.nixos.plasma = { pkgs, inputs, ... }: {

    # KDE Plasma 6
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;
    services.desktopManager.plasma6.enable = true;
    security.rtkit.enable = true;
    services.flatpak.enable = true;

    environment.systemPackages = with pkgs; [
      kdePackages.kde-gtk-config
      kdePackages.plasma-browser-integration
      kdePackages.kdecoration
      kdePackages.flatpak-kcm
      kdePackages.krohnkite
      kdePackages.qtstyleplugin-kvantum
      qt6Packages.qtstyleplugin-kvantum
      kde-rounded-corners
      plasma-panel-colorizer
      klassy
      flatpak
      cmake
      gnumake
      libxcb
      libxkbcommon
      inputs.kwin-effects-better-blur-dx.packages.${pkgs.system}.default
    ];
  };
}
