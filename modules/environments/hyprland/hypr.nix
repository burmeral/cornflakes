  # modules/packages/hypr.nix
  
  { inputs, ... }:
{
  flake.modules.nixos.hypr = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      
      # Locksreen + idle
      hyprsunset
      hyprlock
      hypridle

      # Wallpaper
      awww 

      # Screen capture
      slurp
      swappy
      wf-recorder
      grimblast 

      # Tools
      wtype
      ydotool
      imagemagick
      hyprpicker
      libqalculate
      brightnessctl
      ddcutil
      
      # Fonts
      rubik
      twemoji-color-font
      material-symbols
      nerd-fonts.jetbrains-mono

      # Gnome
      gnome-keyring
      gtk4
      libadwaita

      # Portals
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      
      # Qt deps
      qt6.qtbase
      qt6.qtdeclarative
      qt6.qt5compat
      qt6.qtimageformats
      qt6.qtmultimedia
      qt6.qtpositioning
      qt6.qtsvg
      qt6.qttools
      qt6.qttranslations
      qt6.qtvirtualkeyboard
      qt6.qtwayland
      adwaita-qt
      adwaita-qt6
      kdePackages.qt6ct
      kdePackages.kirigami
      kdePackages.kdialog
      kdePackages.syntax-highlighting
    ];

    services.gnome.gnome-keyring.enable = true;
    services.geoclue2.enable = true;
    security.polkit.enable = true;
    xdg.portal.enable = true;
    programs.dconf.enable = true;
    programs.hyprland.enable = true;
  };
}
