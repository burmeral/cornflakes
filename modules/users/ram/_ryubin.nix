  # modules/users/ram/_ryubin.nix

  { pkgs, ... }:

{
  home.packages = [
    (pkgs.makeDesktopItem {
      name = "ryujinx-canary";
      desktopName = "Ryujinx Canary";
      exec = "env DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1 appimage-run /run/media/ram/SD/roms/switch/ryujinx-canary.AppImage %U";
      icon = "ryujinx";
      categories = [ "Game" "Emulator" ];
      comment = "Nintendo Switch emulator (Canary)";
    })
  ];

  home.file.".local/bin/ryujinx-canary" = {
    executable = true;
    text = ''
      #!/bin/sh
      exec env DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1 appimage-run /run/media/ram/SD/roms/switch/ryujinx-canary.AppImage "$@"
    '';
  };
}
