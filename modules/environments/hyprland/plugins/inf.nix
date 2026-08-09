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
          hash = "sha256-U2gunAI1DbdT9+BE1Ngd87R9qwWgBPNmVlmjJCKTDO4=";
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

          install -Dm755 scripts/infinite-desktop.sh \
            "$out/bin/infinite-desktop"

          install -Dm755 scripts/discover_hyprland_api.sh \
            "$out/share/hyprland-infinite-desktop/discover_hyprland_api.sh"

          # Only the launcher needs wrapping to provide its runtime
          # dependencies.
          wrapProgram "$out/bin/infinite-desktop" \
            --prefix PATH : "${lib.makeBinPath [
              pkgs.bash
              pkgs.jq
              pythonEnv
            ]}"

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
