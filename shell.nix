# deadnix: skip
{pkgs ? import ./nixpkgs.nix {}}: let
  # It's generally recommended to pin your nixpkgs for reproducibility.
  # You can use `nix flake lock` to update it.
  pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/24.11.tar.gz") {};
in {
  default = pkgs.mkShell {
    # Use `nix.extraOptions` instead of directly setting `NIX_CONFIG`.
    # This is more idiomatic and future-proof.
    nix.extraOptions = ''
      experimental-features = nix-command flakes
    '';

    buildInputs = with pkgs; [
      nix
      home-manager
      git
    ];
  };
}
