  # modules/environments/sddm/themes/_sonoma.nix

{ stdenvNoCC }:
stdenvNoCC.mkDerivation {
  pname   = "sonoma-sddm-theme";
  version = "1.0";
  src     = ./sonoma;
  dontBuild = true;
  installPhase = ''
    mkdir -p "$out/share/sddm/themes/Sonoma"
    cp -a \
      AUTHORS \
      LICENSE \
      Main.qml \
      SessionButton.qml \
      metadata.desktop \
      theme.conf \
      theme.conf.user \
      components \
      fonts \
      images \
      "$out/share/sddm/themes/Sonoma"
  '';
}
