# modules/users/ram/_herdr.nix

{ inputs, pkgs, ... }:
{
  imports = [
    inputs.herdr-nix.homeModules.default
  ];

  programs.herdr = {
    enable = true;

    settings = {
      onboarding = false;

      theme = {
        name = "terminal";
        auto_switch = false;
      };

      ui = {
        host_cursor = "native";
        confirm_close = false;

        sidebar_start_collapsed = true;
        sidebar_collapsed_mode = "hidden";

        tab_bar_position = "bottom";

        accent = "cyan";

        mouse_capture = true;
        copy_on_select = true;
        pane_scrollbars = false;
        pane_gaps = false;
      };

      keys = {
        prefix = "ctrl+g";
      
        previous_tab = "ctrl+h";
        next_tab = "ctrl+l";
      
        edit_scrollback = "ctrl+s";
      
        focus_pane_left = "prefix+h";
        focus_pane_right = "prefix+l";      
        focus_pane_up = "prefix+k";
        focus_pane_down = "prefix+j";      
      };

    };

    plugins = {
      vim-herdr-navigation = inputs.vim-herdr-navigation;
    };

    extraPackages = with pkgs; [
      git
      openssh
      lazygit
      jq
    ];
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
