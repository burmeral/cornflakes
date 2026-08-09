  # modules/environments/plasma/_wavetask.nix


{ pkgs, ... }:

let
  wavetask = pkgs.callPackage (
    { lib
    , stdenv
    , fetchFromGitHub
    , cmake
    , qt6
    , kdePackages
    }:

    stdenv.mkDerivation rec {
      pname = "wavetask";
      version = "unstable";

      src = fetchFromGitHub {
        owner = "vickoc911";
        repo = "org.vicko.wavetask";
        rev = "053b91f75cd239697ff451166a895a9c01c3794a";
        hash = "sha256-Zk41zcfm+FtnHFNVT+/R9PfpyFYUt7Gk0vVaFXhzCbU=";
        fetchSubmodules = true;
      };

    postPatch = ''
      substituteInPlace package/contents/ui/ConfigAppearance.qml \
        --replace-fail "to: 64" "to: 96"

      substituteInPlace package/contents/ui/main.qml \
        --replace-fail "Plasmoid.configuration.iconSize * 1.20" \
                       "Plasmoid.configuration.iconSize * 1.55"
    '';

      dontWrapQtApps = true;

      nativeBuildInputs = [
        cmake
        kdePackages.extra-cmake-modules
      ];

      buildInputs = [
        qt6.qtbase
        qt6.qtdeclarative

        kdePackages.ki18n
        kdePackages.kservice
        kdePackages.kwindowsystem

        kdePackages.libplasma
        kdePackages.plasma-workspace
        kdePackages.plasma-activities
        kdePackages.plasma-activities-stats
        kdePackages.kwin
      ];
    }
  ) {};
in
{
  home.packages = [
    wavetask
  ];
}
