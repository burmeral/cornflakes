  # modules/users/users.nix

  { inputs, lib, ... }:

let
  mkUser = { username, wheel ? false, autologin ? false }:
    let
      homePath = ./${username}/_imports.nix;
      hasHome = builtins.pathExists homePath;
    in {
        users.users.${username} = {
          isNormalUser = true;
          description  = username;
          extraGroups  = [ "networkmanager" "video" "render" "input" "audio" ]
            ++ lib.optional wheel "wheel";
        };
  
        services.getty.autologinUser = lib.mkIf autologin username;
  
        home-manager = {
          useGlobalPkgs    = true;
          useUserPackages  = true;
          extraSpecialArgs = { inherit inputs; };
          sharedModules    = [ inputs.plasma-manager.homeModules.plasma-manager ];
        } // lib.optionalAttrs hasHome {
          users.${username} = import homePath;
        };
      };

  # ┌─────────────┐
  # │  User list  │
  # └─────────────┘

  wheel-users = [
    { username = "ram"; autologin = false; }
    { username = "uri"; autologin = false; }
  ];

  normal-users = [
  ];

in {
  flake.modules.nixos.users = { lib, ... }: {
    config = lib.mkMerge (
      map (u: mkUser (u // { wheel = true; })) wheel-users
      ++ map mkUser normal-users
    );
  };
}
