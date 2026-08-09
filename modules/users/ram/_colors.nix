  # modules/users/ram/_colors.nix

  { pkgs, ... }:
{
  home.packages = with pkgs; [
    jq
    python3
    wallust
    (writeShellScriptBin "scheme" ''
      exec "$HOME/.config/wallust/scripts/scheme" "$@"
    '')
  ];
}
