# modules/users/ram/_browser.nix

{ inputs, pkgs, config, lib, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;

    configPath = "${config.xdg.configHome}/mozilla/firefox";

    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
      DisablePocket = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;

      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;

      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;

      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };

    profiles.default = {
      isDefault = true;

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "extensions.autoDisableScopes" = 0;
      };
    };
  };
}
