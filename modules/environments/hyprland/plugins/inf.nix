# modules/environments/hyprland/inf.nix

  { ... }:
{
  perSystem = { pkgs, lib, ... }:

  let
    pythonEnv = pkgs.python3.withPackages (ps: [
      ps.evdev
    ]);
  in
  {
    packages.hyprland-infinite-desktop =
      pkgs.stdenvNoCC.mkDerivation {
        pname = "hyprland-infinite-desktop";
        version = "unstable";

        src = pkgs.fetchFromGitHub {
          owner = "burmeral";
          repo = "hyprland-infinitie-desktop-v2";
          rev = "main";
          hash = "sha256-UhN1qocNBs0OaIf+T/PloMHstlCEcLEd6WjRKqcGCTg=";
        };

        nativeBuildInputs = [
          pkgs.makeWrapper
        ];

        postPatch = ''
          patchShebangs scripts
        '';

        installPhase = ''
          runHook preInstall

          install -d "$out/bin"
          install -d "$out/share/hyprland-infinite-desktop"

          # Preserve the upstream layout by installing every Python script into
          # the same directory. Helper modules remain importable without
          # modifying upstream.
          for script in scripts/*.py; do
            install -Dm755 "$script" \
              "$out/bin/$(basename "$script")"
          done

          install -Dm755 scripts/discover_hyprland_api.sh \
            "$out/share/hyprland-infinite-desktop/discover_hyprland_api.sh"

          # Run the core directly: infinite-desktop.sh gates startup on
          # device *names*, while the core already detects by capability.
          makeWrapper ${pythonEnv}/bin/python3 "$out/bin/infinite-desktop" \
            --add-flags "$out/bin/infinite_desktop_core.py 1.6"

          runHook postInstall
        '';

        meta = with lib; {
          description = "Window navigation and manipulation utilities for Hyprland Infinite Desktop";
          homepage = "https://github.com/burmeral/hyprland-infinitie-desktop-v2";
          license = licenses.mit;
          platforms = platforms.linux;
        };
      };
  };
}
