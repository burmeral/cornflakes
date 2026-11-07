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

      please        = "sudo";
      spf           = "superfile";
      v             = "nvim";
      h             = "herdr";
      lg            = "lazygit";
      slg           = "sudo lazygit";
      audacious     = "env -u QT_QPA_PLATFORMTHEME -u QT_STYLE_OVERRIDE /home/ram/.local/bin/audacious-winamp";
      sdown         = "spotdl download --format flac --embed-metadata --overwrite force";
      fetch         = "fastfetch --config ~/.config/fastfetch/minimal.jsonc";
      hfetch        = "fastfetch --config ~/.config/fastfetch/hardware.jsonc";
      prismlauncher = "steam-run prismlauncher"; 

    };

    initContent = ''

      zmodload zsh/datetime

      # emacs path
      # export PATH="$HOME/.config/emacs/bin:$PATH"

      # vi mode
      bindkey -v
      export KEYTIMEOUT=1

      # zsh
      autoload -Uz vcs_info

      # git
      zstyle ':vcs_info:git:*' formats '(%b)'
      setopt PROMPT_SUBST

      # command execution timer
      preexec() {
        local -a words
        words=( ''${(z)1} )
      
        case "''${words[1]}" in
          nvim|v)
            unset CMD_START
            return
            ;;
        esac

        CMD_START=$EPOCHREALTIME
      }
      
      precmd() {
        vcs_info
      
        if [[ -n "$CMD_START" ]]; then
          local elapsed=$(( EPOCHREALTIME - CMD_START ))
      
          if (( elapsed >= 1 )); then
            if (( elapsed < 60 )); then
              RPROMPT="''${elapsed%.*}s"
            elif (( elapsed < 3600 )); then
              RPROMPT="$(( elapsed / 60 ))m $(( elapsed % 60 ))s"
            else
              RPROMPT="$(( elapsed / 3600 ))h $(( (elapsed % 3600) / 60 ))m"
            fi
          else
            RPROMPT=""
          fi
      
          unset CMD_START
        fi
      }    

      PROMPT='λ %F{blue}%3~%f %F{white}''${vcs_info_msg_0_}%f '

      # if [[ -o interactive && -t 1 && -z "$HERDR_ENV" && -z "$SSH_CONNECTION" ]]; then
      #   exec herdr
      # fi

    '';
  };
}
