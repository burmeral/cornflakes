  # modules/environments/plasma/plugins/_fonts.nix

  { ... }:
{
  programs.plasma.fonts = {
    general     = { family = "SF Pro Text"; pointSize = 10; };
    fixedWidth  = { family = "JetBrains Mono"; pointSize = 10; };
    small       = { family = "SF Pro Text";    pointSize = 9; };
    toolbar     = { family = "SF Pro Text"; pointSize = 10; };
    menu        = { family = "SF Pro Text"; pointSize = 10; };
    windowTitle = { family = "SF Pro Text"; pointSize = 10; };
  };
}
