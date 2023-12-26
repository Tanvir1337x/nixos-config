{
  self,
  config,
  ...
}: let
  inherit (config.flake) nixosModules;
in {
  flake.nixosModules.default.imports = [
    nixosModules.system-nix
    # nixosModules.system-time
    # nixosModules.services-tor
    # nixosModules.services-vikunja
    # nixosModules.users
  ];

  imports = [
    ./modules
    # ./users
  ];
}
