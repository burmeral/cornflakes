  # modules/packages/nvim.nix

  { ... }:
{
  flake.modules.nixos.nvim = { pkgs, ... }: {

    environment.systemPackages = with pkgs; [

      # You're my new friend now :D, we're having soft tacos later!
      neovim

      # Dependencies
      tree-sitter # language & parsing sitting in a tree, K.I.S.S.I.N.G
      gcc         # for native compilation
      fd          # poopenFarDen or whatever the Germans say
      sqlite      # databased
      tectonic    # pretty math
      ghostscript # boo! It's a pdf! D:
      mermaid-cli # and they didn't invite sirens?

    ];
  };
}
