# modules/hosts/syncthing.nix

  { ... }:
{
  flake.modules.nixos.syncthing = { ... }: {
    services.syncthing = {
      enable = true;
      user = "ram";
      dataDir = "/home/ram";
      configDir = "/home/ram/.config/syncthing";
      openDefaultPorts = true;
      settings = {
        devices = {
          ipad = {
            id = "7UNB2MQ-ICYNDYZ-7RVJJO7-AGISDEB-W6HSL3W-WXXCCDN-OPVIFHU-FOZ6OAD";
            name = "ipad";
          };
          koch = {
            id = "AR62HZ4-HLRWHLJ-R54MST4-WK2KMA5-UB5H74J-3GLXJKY-DOXL6HW-CAQGMAP";
            name = "koch";
          };
          sier = {
            id = "L6CJPDR-N5V3CSL-GNBJ6RD-IHTU575-5CW5EUU-ZH3DFIH-OAKTWBM-KZE4NAS";
            name = "sier";
          };
          cross = {
            id = "WLQX5EU-C5PNTDG-GY2M3AF-IB24MWH-H5YLLO2-CH65KNJ-VOKXYPY-BRBJPQ4";
            name = "cross";
          };
        };

        folders = {
          obsidian = {
            path = "/home/ram/Obsidian";
            devices = [ "ipad" "koch" "sier" ];
            versioning = {
              type = "simple";
              params.keep = "5";
            };
          };
          music = {
            path = "/home/ram/Music";
            devices = [ "koch" "sier" ];
          };
          music-portable = {
            path = "/home/ram/Music/ipad";
            devices = [ "ipad" ];
          };
          books = {
            path = "/home/ram/Books";
            devices = [ "koch" "ipad" "sier" ];
          };
          archive = {
            path = "/home/ram/Archive";
            devices = [ "koch" "sier" "cross" ];
          };
          org = {
            path = "/home/ram/Org";
            devices = [ "koch" "sier" "cross" ];
          };
        };
      };
    };
  };
}
