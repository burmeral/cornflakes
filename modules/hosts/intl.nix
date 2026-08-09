  # modules/hosts/intl.nix

  { ... }:
{
  flake.modules.nixos.intl = { pkgs, ... }: {

    # Time zone
    time.timeZone = "America/Chicago"; 

    # International characters
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
      font = "Lat2-Terminus16";
      keyMap = "us";
    };    

    # Right Alt compose ( ~ + n = ñ ) and Caps Lock esc
    services.xserver.xkb.options = "compose:ralt,caps:escape";

    # Jpn input
    i18n.inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk
        kdePackages.fcitx5-configtool
       ];
    };

    # Font compatibility
    fonts = {
      enableDefaultPackages = true;
      packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans   
        noto-fonts-color-emoji
      ];
    };
  };
}
