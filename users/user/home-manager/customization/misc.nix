# Home Manager User's Misc Configuration
_: let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.user = {pkgs, ...}: {
    home = {
      pointerCursor = {
        gtk.enable = true;
        package = pkgs.bibata-cursors;
        name = "Bibata-Original-Classic";
        size = 32;

        x11 = {
          enable = true;
          defaultCursor = "Bibata-Original-Classic";
        };

        hyprcursor = {
          enable = false;
          size = 32;
        };
      };
    };

    # Some applications (e.g. Firefox) don't seem to use XSETTINGS to control text rendering
    # Putting these settings in ~/.Xresources seems to work
    xresources.properties = {
      # Font
      # "Xft.dpi" = 100;
      "Xft.antialias" = 1;
      "Xft.hinting" = 1;
      "Xft.autohint" = 0;
      "Xft.hintstyle" = "hintfull";
      # "Xft.rgba" = "rgb";
    };
  };
}
