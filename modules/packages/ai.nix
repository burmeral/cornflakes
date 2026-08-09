  # modules/packages/ai.nix

{ ... }:
  {
    flake.modules.nixos.ai = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        ollama
        jan
        docker-compose
      ];

      # Ollama
      services.ollama.enable = true;

      # Docker
      virtualisation.docker.enable = true;

      # Open webUI
      services.open-webui = {
        enable = true;
        port = 8080;
      };

      # n8n
      services.n8n = {
       enable = true;
       openFirewall = true;
      };

      # PostgreSQL (vector store)
      services.postgresql = {
        enable = true;
        ensureDatabases = [ "n8n" ];
        ensureUsers = [{
          name = "n8n";
          ensureDBOwnership = true;
        }];
      };
    };
  }
