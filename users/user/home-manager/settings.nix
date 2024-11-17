# Home Manager User's Settings Configuration
_: let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager = {
    verbose = true;
    # Use the global pkgs that is configured via the system level nixpkgs options
    useGlobalPkgs = true;
    # Installs packages to /etc/profiles instead of $HOME/.nix-profile
    # necessary to use nixos-rebuild build-vm
    useUserPackages = true;

    users.user = _: {
      xdg.configFile = {
        "kitty/kitty.conf".enable = false;
      };

      home = {
        username = "user";
        homeDirectory = "/home/user";
        stateVersion = "23.05";
      };
    };
  };
}
