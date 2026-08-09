  # modules/users/users.nix

  { inputs, lib, ... }:

let
  mkUser = { username, wheel ? false, autologin ? false, greeter ? false }:

  let
    homePath = ./${username}/_imports.nix;
    hasHome = builtins.pathExists homePath;
  in
    lib.mkMerge [
    ({
      users.users.${username} = {
        isNormalUser = true;
        description  = username;
        extraGroups  = [ "networkmanager" "video" "render" "input" ]
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
    })
    (lib.mkIf greeter {
      ram.sddm.greeterUser = username;
    })
  ];

  # ┌─────────────┐
  # │  User list  │
  # └─────────────┘

  wheel-users = [
    { username = "ram"; autologin = false; greeter = true;}
    { username = "uri"; autologin = false; }
  ];

  normal-users = [
  ];

in {
  flake.modules.nixos.users = { lib, ... }: {
    options.ram.sddm.greeterUser = lib.mkOption {
      type        = lib.types.str;
      description = "User whose ~/Assets/Greeter/current.jpg SDDM should mirror.";
    };
    config = lib.mkMerge (
      map (u: mkUser (u // { wheel = true; })) wheel-users
      ++ map mkUser normal-users
    );
  };
}
