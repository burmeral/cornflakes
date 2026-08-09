  # modules/packages/reader.nix

  { ... }:
{
  flake.modules.nixos.reader = { pkgs, inputs, ... }: {

    environment.systemPackages = with pkgs; [

      # Bookrokrat (pdf-reader)
      (pkgs.rustPlatform.buildRustPackage {
        pname = "bookokrat";
        version = "0.3.12";
        src = inputs.bookokrat;
        cargoHash = "sha256-OIZElPcEJVC4clgWgBApnEKYNvYrBGhWhFUebf3tcnM=";
        doCheck = false;
         nativeBuildInputs = with pkgs; [
           pkg-config
           llvmPackages.clang
           python3
           unzip
         ];
         buildInputs = [ pkgs.fontconfig ];
         LIBCLANG_PATH = "${pkgs.llvmPackages.libclang.lib}/lib"; })

    ];
  };
}
