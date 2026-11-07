  # modules/packages/terminal.nix

  { ... }:
{
  flake.modules.nixos.terminal = { pkgs, ... }: {

    environment.systemPackages = with pkgs; [

      # Environment
      kitty        # cat cat :3
      zsh          # shell
      # herdr        # giving your terminal the five ram treatment 
      fzf          # warm & fuzzy
      telescope    # because glasses weren't enough

      # Utilities
      khal         # calendar
      btop         # process mon
      lazygit      # git for bums
      ranger       # to wrangle those files

      # Touys
      fastfetch    # my spiderman lunchbox is better than urs
      cbonsai      # snip-snip
      cmatrix      
      terminal-rain-lightning
      lavat        # atp just go get yourself one of those spinning fruit sensory videos. You'll like it, I promise.
      pipes-rs

      cowsay       # moo
      kittysay     # miau
      ponysay      # neigh

      # Downloads
      wget
      git
      curl
      stow

      # Manuals
      man
      wikiman

      # Tools
      busybox      # zip files
      unrar        # rar files 
      p7zip        # defeat my 7 evil zip files
      udiskie      # automount
      ripgrep      # search on steroids
      ripgrep-all  # and on stims too
      imagemagick  # pretty pictures
      chafa        # moar graphics
      nsxiv        # I lied... 

      # Nix
      nh           # no more Shakesperean nix we're illiterate now
      nix-prefetch # prefecth package sources

    ];
  };
}
