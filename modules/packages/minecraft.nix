  # modules/packages/minecraft.nix

  { inputs, ... }:
{
  flake.modules.nixos.minecraft = { pkgs, ... }: {

    environment.systemPackages = with pkgs; [
      # Java
      prismlauncher

      # Bedrock
      # mcpelauncher-ui-qt
    ];
  };
}
