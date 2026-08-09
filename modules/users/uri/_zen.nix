  # modules/users/uri/_zen.nix

  { inputs, pkgs, config, lib, ... }:
{
  imports = [ inputs.zen-browser.homeModules.beta ];

  # zen-browser
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
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

    # zen mods
    profiles.default = {
      mods = [
        "f4866f39-cfd6-4498-ab92-54213b8279dc"  # Animations+
        "2317fd93-c3ed-4f37-b55a-304c1816819e"  # Audio inidicators
        "a6335949-4465-4b71-926c-4a52d34bc9c0"  # Better find bar
        "664c54f9-d97d-410b-a479-23dd8a08a628"  # Better tab indicators
        "b0f635d7-c3bf-4709-af68-4712f0e5b2e5"  # Cleaner bookmarks
        #"181e41d4-dfd3-410d-9a73-561381a2f77d"  # Extensions list
        "253a3a74-0cc4-47b7-8b82-996a64f030d5"  # Floating history
        "906c6915-5677-48ff-9bfc-096a02a72379"  # Floating status bar
        "cb15abdb-0514-4e09-8ce5-722cf1f4a20f"  # Hide extension name
        "803c7895-b39b-458e-84f8-a521f4d7a064"  # Hide inactive workspaces
        "e34745fd-2b7f-4c16-b03a-6e29e5c3f20a"  # Hide toolbar
        "1e86cf37-a127-4f24-b919-d265b5ce29a0"  # Lean
        "ae7868dc-1fa1-469e-8b89-a5edf7ab1f24"  # Load bar
        "4ab93b88-151c-451b-a1b7-a1e0e28fa7f8"  # No sidebar scrollbar
        "f50841b2-5e4a-4534-985d-b7f7b96088c2"  # No split highlights
        "dbe05f83-b471-4278-a3f9-e5ed244b0d6c"  # Old navigation buttons
        "4596d8f9-f0b7-4aeb-aa92-851222dc1888"  # Only close on hover
        "599a1599-e6ab-4749-ab22-de533860de2c"  # Pimp your PiP
        "bc25808c-a012-4c0d-ad9a-aa86be616019"  # Sleek border
        "e51b85e6-cef5-45d4-9fff-6986637974e1"  # Smaller toast popup
        "87196c08-8ca1-4848-b13b-7ea41ee830e7"  # Tab preview enhanced
        "7190e4e9-bead-4b40-8f57-95d852ddc941"  # Tab title fixes
        "79dde383-4fe7-404a-a8e6-9be440022542"  # Tidy popup
        "642854b5-88b4-4c40-b256-e035532109df"  # Transparent zen
        "4c2bec61-7f6c-4e5c-bdc6-c9ad1aba1827"  # Vertical split tab groups
        "c8d9e6e6-e702-4e15-8972-3596e57cf398"  # Zen back forward
        "03a8e7ef-cf00-4f41-bf24-a90deeafc9db"  # Zen colored picker
        "81fcd6b3-f014-4796-988f-6c3cb3874db8"  # Zen context menu
      ];
    };
  };
  xdg.configFile."zen/default/chrome/userChrome.css" = {
    force = true;
    text = "";
  };
  xdg.configFile."zen/default/chrome/userContent.css" = {
    force = true;
    text = "";
  };
}
