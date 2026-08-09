  # modules/hosts/store.nix

  { ... }:
{
  flake.modules.nixos.store = { pkgs, ... }: {

    # Enable flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Automatic storage optimization
    nix.optimise.automatic = true;
    nix.optimise.dates = [ "07:00" ];

    # Garbage collection
    programs.nh = {
      enable = true;

      clean = {
        enable = true;
        extraArgs = "--keep 10";
      };
    };

    # enable appimage support
    programs.appimage.enable = true;
    programs.appimage.binfmt = true;

    # allow unfree packages
    nixpkgs.config.allowUnfree = true;

    nixpkgs.config.permittedInsecurePackages = [
      "electron-40.10.5"
      "pnpm-9.15.9"
    ];

    # Enable dynamic executables
    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [
        icu
        openssl
        zlib
        libGL
        vulkan-loader
        SDL2
      ];
    };
  };
}

