# Home Manager User's Services Configuration
{pkgs, ...}: let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.user = _: {
    services = {
      gnome-keyring.enable = true;

      xsettingsd = {
        enable = true;
        settings = {
          # Font
          "Xft/Antialias" = 1;
          "Xft/Hinting" = 1;
          "Xft/HintStyle" = "hintfull";
          # "Xft/RGBA" = "rgb";

          # Theme
          "Net/ThemeName" = "Colloid-Dark";
          "Net/IconThemeName" = "Tela-black-dark";
          "Gtk/CursorThemeName" = "Bibata-Original-Classic";

          # Misc
          "Net/CursorBlink" = 1;
        };
      };

      flameshot = {
        enable = true;
        package = pkgs.flameshot;
        settings = {
          General = {
            allowMultipleGuiInstances = true;
            autoCloseIdleDaemon = true;
            contrastOpacity = 191;
            drawColor = "#00e9ff";
            drawThickness = 1;
            saveAfterCopy = true;
            savePath = "/home/user/media/pictures/screenshots";
            showMagnifier = true;
            uiColor = "#c38f8f";
            uploadHistoryMax = 100;
            userColors = "picker, #00ff00, #000000, #ff2e00, #ff0069, #ff00aa, #a400ff, #0d00ff, #00e9ff, #00ffa5, #75baff";
          };
        };
      };

      kdeconnect = {
        enable = true;
        indicator = true;
        package = pkgs.kdePackages.kdeconnect-kde;
      };

      easyeffects = {
        enable = true;
        package = pkgs.easyeffects;
        # Community Presets: <https://github.com/wwmm/easyeffects/wiki/PulseEffects-Wiki#community-presets>
        # <https://github-wiki-see.page/m/wwmm/easyeffects/wiki/Community-Presets>
        # preset = "Music";
      };

      screen-locker = {
        enable = false;
        xautolock.enable = true;
        inactiveInterval = 10;
        lockCmd = "${pkgs.i3lock-fancy-rapid}/bin/i3lock-fancy-rapid 5 5";
      };

      # <https://activitywatch.net>
      activitywatch = {
        enable = true;
        package = pkgs.aw-server-rust;

        /*
        settings = {
          address = "127.0.0.1";
          port = 5600;
        };

        extraOptions = [
          "--port"
          "5600"
        ];
        */

        # <https://docs.activitywatch.net/en/latest/configuration.html>
        watchers = {
          awatcher.package = pkgs.awatcher;

          aw-watcher-afk = {
            package = pkgs.aw-server-rust;
            settings = {
              poll_time = 5;
              timeout = 180;
            };
          };

          aw-watcher-window = {
            package = pkgs.aw-server-rust;
            settings = {
              exclude_title = false;
              poll_time = 1;
            };
          };
        };
      };

      # Blueman Applet
      blueman-applet.enable = false;

      # Network Manager Applet
      network-manager-applet.enable = false;

      # PulseAudio System Tray
      # Replacement for the deprecated padevchooser
      pasystray.enable = false;

      # Compositor (X11)
      picom = {
        enable = false;
        package = pkgs.picom-pijulius;
      };

      # Clipboard Manager
      # copyq.enable = true;

      udiskie = {
        enable = true; # requires services.udisks2.enable = true
        automount = true;
        notify = true;
        tray = "never";
      };

      gpg-agent = {
        enable = true;
        verbose = true;
        enableSshSupport = true;
        enableScDaemon = true;
        grabKeyboardAndMouse = true;

        pinentryPackage = pkgs.pinentry-gnome3;

        enableBashIntegration = true;
        enableFishIntegration = true;
        enableZshIntegration = true;
        enableNushellIntegration = true;
      };

      spotifyd = {
        enable = false;
        package = pkgs.spotifyd.override {withKeyring = true;};
        settings = {
          global = {
            username = "Tanvir";
            password = "SECRET";
            device_name = "NixOS";
          };
        };
      };
    };
  };
}
