  # modules/packages/emacs.nix

{ ... }:
  {
    flake.modules.nixos.emacs = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [

        # The one and only (lies there's so many emacs)
        emacs-pgtk

        # Doom deps
        git
        ripgrep
        fd
        findutils
        multimarkdown
        shellcheck

        # Language tooling 
        nodejs  # for some Doom modules
        python3
        gcc     # for native compilation
        aspell
        aspellDicts.en
        imagemagick               
        jq
        uv
        xdg-user-dirs
        rsync
        yq-go
        gobject-introspection
        cmake
        gnumake
        libtool
        graphviz
        cmigemo
        pipenv
        isort        # python import sorting
        python3Packages.pytest    # python testing
        python3Packages.nose2
        nixfmt-rfc-style
        texliveFull

        # Native comp
        (emacs.override { withNativeCompilation = true; })
      ];
    };
  }
