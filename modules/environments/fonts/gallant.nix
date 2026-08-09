  # modules/environments/fonts/gallant.nix

  { ... }:
{
  flake.modules.nixos.gallant = { pkgs, lib, inputs, ... }:

  let
    gallant-outline = pkgs.stdenvNoCC.mkDerivation {
      pname   = "gallant-outline";
      version = "unstable-2024";

      src = pkgs.fetchFromGitHub {
        owner = "NanoBillion";
        repo  = "gallant";
        rev   = "main";
        hash  = "sha256-UL6pcjRZbVh+dknAXQBuYw1NWFKDeXAShCFtHtHFoMU=";
      };

      nativeBuildInputs = with pkgs; [
        (python3.withPackages (ps: [ ps.fonttools ps.fontforge ]))
        potrace
        imagemagick
      ];

      dontBuild = true;

      installPhase = ''
        runHook preInstall
        export HOME=$(mktemp -d)
        python3 ${./gallant-trace.py}
        runHook postInstall
      '';

      meta = {
        description = "Gallant bitmap font (Sun Microsystems) converted to outlines";
        homepage    = "https://github.com/NanoBillion/gallant";
        license     = lib.licenses.mit;
        platforms   = lib.platforms.all;
      };
    };

  in
  {
    fonts.packages = [ gallant-outline ];
  };
}
