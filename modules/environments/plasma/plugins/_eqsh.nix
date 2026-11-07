# modules/environments/plasma/plugins/_eqsh.nix

{ inputs, pkgs, ... }:
let
  aureli-cli = pkgs.python3Packages.buildPythonApplication {
    pname = "aureli-cli";
    version = "unstable";

    src = pkgs.fetchFromGitHub {
      owner = "eq-desktop";
      repo  = "cli";
      rev   = "main";
      hash  = "sha256-9ppkB1wbYv8Q1Og8Ss2h8pyWt9L2HT/BA+YMW+3gvEo="; 
      };

    pyproject = true;

    build-system = with pkgs.python3Packages; [
      setuptools
    ];

    propagatedBuildInputs = with pkgs.python3Packages; [
      requests
    ]; 

    meta = {
      description = "Official CLI (au) for the eqSh/Aureli Hyprland shell";
      homepage    = "https://github.com/eq-desktop/cli";
      license     = pkgs.lib.licenses.mit;
      mainProgram = "au";
    };
  };
in
{
  home.packages = [
    aureli-cli
    inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  home.file.".local/share/equora/eqSh" = {
    source = pkgs.fetchFromGitHub {
      owner         = "eq-desktop";
      repo          = "eqsh";
      rev           = "2eea698ec832a1b3dacb8cd5d566a5416cb11dff";
      hash          = "sha256-9kwGpM9MzHoVmeD02A6p2Yc3+AIXiIb/eeVdt3ZPiYM="; 
      fetchSubmodules = true;
    };
    recursive = true;
  };
}
