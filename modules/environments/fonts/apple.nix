  # modules/environments/fonts/apple.nix

  { ... }:
{
  flake.modules.nixos.applefonts = { pkgs, inputs, ... }: {

  fonts.packages = [
    inputs.apple-fonts.packages.${pkgs.system}.sf-pro
  ];

    fonts.fontconfig = {
      defaultFonts.sansSerif = [ "SF Pro Display" "SF Pro Text" ];
      localConf = ''
        <?xml version="1.0"?>
        <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
        <fontconfig>
          <alias>
            <family>sans-serif</family>
            <prefer>
              <family>SF Pro Display</family>
              <family>SF Pro Text</family>
              <family>SF Pro Rounded</family>
            </prefer>
          </alias>
          <match target="font">
            <test name="family"><string>Gallant</string></test>
            <edit name="antialias"  mode="assign"><bool>false</bool></edit>
            <edit name="hinting"    mode="assign"><bool>true</bool></edit>
            <edit name="hintstyle"  mode="assign"><const>hintfull</const></edit>
            <edit name="rgba"       mode="assign"><const>none</const></edit>
          </match>
        </fontconfig>
      '';
    };
  };
}
