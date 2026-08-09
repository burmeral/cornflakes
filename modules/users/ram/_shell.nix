  # modules/users/ram/_shell.nix

  { inputs, pkgs, config, lib, ... }:
{
  # enable bash
  programs.bash = {
    enable = true;
    initExtra = ''
      if [[ $- == *i* ]] && [[ -z "$IN_NIX_SHELL" ]]; then
        exec zsh
      fi
    '';
  };

  # enable zsh
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    shellAliases = {

      spf       = "superfile";
      v         = "nvim";
      lg        = "lazygit";
      slg       = "sudo lazygit";
      audacious = "env -u QT_QPA_PLATFORMTHEME -u QT_STYLE_OVERRIDE /home/ram/.local/bin/audacious-winamp";
      fetch     = "fastfetch --config ~/.config/fastfetch/minimal.jsonc";
      hfetch    = "fastfetch --config ~/.config/fastfetch/hardware.jsonc";
      prismlauncher = "steam-run prismlauncher"; 

    };

    initContent = ''

      # emacs path
      # export PATH="$HOME/.config/emacs/bin:$PATH"

      # vi mode
      bindkey -v
      export KEYTIMEOUT=1

      # zsh
      autoload -Uz vcs_info
      precmd() { vcs_info }
      zstyle ':vcs_info:git:*' formats '(%b)'
      setopt PROMPT_SUBST
      
      PROMPT='%F{blue}%n%f  %F{blue}%3~%f %F{white}''${vcs_info_msg_0_}%f '

      # startup

    '';
  };
}
