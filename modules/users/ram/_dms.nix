  # modules/users/ram/_dms.nix

  { inputs, pkgs, ... }:
{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.dms-plugin-registry.homeModules.default
  ];

  programs.dank-material-shell = {

    enable = true;
    systemd.enable = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableSystemMonitoring = true;
    enableClipboardPaste = true;
    enableVPN = true;
    quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;

    settings = {

    };

    plugins = {

      # functionality
      dankBatteryAlerts.enable = true;
      screenCaptureToolbar.enable = true;
      ddcBrightness.enable = true;
      audioSwitcher.enable = true;
      displayOutput.enable = true;
      keybindingCheatSheet.enable = true;
      mediaFrame.enable = true;

      # customization
      linuxWallpaperEngine.enable = true;
      kaomojiPicker.enable = true;
      emojiLauncher.enable = true;

      # productivity
      timer.enable = true;
      dankCalendar.enable = true;
      canvasGrades.enable = true;
      obsidianSearch.enable = true;
      webSearch.enable = true;
      calculator.enable = true;


      discordVoice.enable = true;
      easyEffects.enable = true;

      # automation
      dankActions.enable = true;
      dankHooks.enable = true;

    };
  };

  systemd.user.services.dms = {
    Unit = {
      After = [ "graphical-session.target" "hyprland-session.target" ];
      PartOf = [ "graphical-session.target" ];
      Wants = [ "graphical-session.target" ];
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
