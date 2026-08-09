  # modules/users/ram/_otter.nix

  { inputs, pkgs, lib, config, ... }:
{
  imports = [ inputs.otter-launcher.homeModules.default ];

  programs.otter-launcher.enable = true;

  home.packages = with pkgs; [ fsel ];
}
