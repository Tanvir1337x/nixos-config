# Rip Out Default Home-Manager Packages
_: let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.user = _: {
    manual = {
      html.enable = false;
      json.enable = false;
      manpages.enable = false;
    };

    programs = {
      man.enable = false;
      man.package = null;
    };
  };
}
