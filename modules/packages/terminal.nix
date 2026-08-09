  # modules/packages/terminal.nix

  { ... }:
{
  flake.modules.nixos.terminal = { pkgs, ... }: {

    environment.systemPackages = with pkgs; [

      # Terminal
      kitty        # cat cat :3
      zsh          # shell
      herdr        # giving your terminal the five ram treatment 
      fzf          # warm & fuzzy
      telescope    # because glasses weren't enough

      # Utilities
      khal         # calendar
      rmpc         # crank that soulja boy
      btop         # process mon
      lazygit      # git for bums

      # Touys
      fastfetch    # my spiderman lunchbox is better than urs
      cbonsai
      cmatrix
      terminal-rain-lightning
      lavat

      # Downloads
      wget
      git
      curl
      stow

      # Manuals
      man
      wikiman

      # Files
      superfile

      # Tools
      busybox      # zip files
      udiskie      # automount
      ripgrep      # search on steroids
      ripgrep-all  # and on stims too
      imagemagick  # pretty pictures
      chafa        # moar graphics

      # Nix
      nh           # no more Shakesperean nix we're illiterate now
      nix-prefetch # prefecth package sources

    ];
  };
}
