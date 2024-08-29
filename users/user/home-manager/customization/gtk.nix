# Home Manager User's GTK Configuration
_: let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.user = {pkgs, ...}: {
    gtk = {
      enable = true;

      theme = {
        package = pkgs.colloid-gtk-theme;
        # Easily find the exact names using lxappearance
        name = "Colloid-Dark";
      };

      iconTheme = {
        package = pkgs.tela-icon-theme;
        # Easily find the exact names using lxappearance
        name = "Tela-black-dark";
      };

      cursorTheme = {
        package = pkgs.bibata-cursors;
        # Easily find the exact names using lxappearance, fc-list
        name = "Bibata-Original-Classic";
        size = 30;
      };

      font = {
        package = pkgs.fira-code;
        # Easily find the exact names using lxappearance
        name = "Fira Code";
        size = 14;
      };

      /*
      gtk2 = {
        extraConfig = "gtk-can-change-accels = 1";
      };
      */

      gtk3 = {
        bookmarks = [
          "file:///home/user"
          "file:///home/user/downloads"
          "file:///home/user/media/pictures/screenshots"
          "file:///mnt/media1"
          "file:///mnt/media2"
          "file:///mnt/media3"
          "file:///mnt/windows"
          "file:///mnt/games"
        ];

        # <https://docs.gtk.org/gtk3/class.Settings.html#properties>
        extraConfig = {
          # gtk-application-prefer-dark-theme = 1;

          # Remove the app menu (Minimize / Maximize / Close buttons) from the title bar
          gtk-decoration-layout = "menu:none";

          gtk-xft-antialias = 1;
          gtk-xft-hinting = 1;
          gtk-xft-hintstyle = "hintmedium";
          # gtk-xft-rgba = "rgb";
        };
      };

      gtk4 = {
        # <https://docs.gtk.org/gtk4/class.Settings.html#properties>
        extraConfig = {
          # gtk-application-prefer-dark-theme = 1;

          # Remove the app menu (Minimize / Maximize / Close buttons) from the title bar
          gtk-decoration-layout = "menu:none";

          gtk-xft-antialias = 1;
          gtk-xft-hinting = 1;
          gtk-xft-hintstyle = "hintmedium";
          # gtk-xft-rgba = "rgb";
        };
      };
    };
  };
}
