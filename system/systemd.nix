# Systemd Configuration
{pkgs, ...}: {
  systemd = {
    # Disable coredump that could be exploited later
    # and also slow down the system when something crash
    # If disabled, core dumps appear in the current directory of the crashing process
    coredump.enable = true;

    # To avoid system freeze
    oomd.enable = true;

    # Disable as it slows down the boot time
    services.NetworkManager-wait-online.enable = false;

    user.services = {
      polkit-kde-authentication-agent-1 = {
        description = "polkit-kde-authentication-agent-1";
        wantedBy = ["xdg-desktop-portal.service"];
        wants = ["xdg-desktop-portal.service"];
        after = ["xdg-desktop-portal.service"];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };

      /*
      picom = {
        after = ["display-manager.service"];
        partOf = ["display-manager.service"];
        wantedBy = ["display-manager.service"];
      };
      */

      # Replaced by home-manager activitywatch service
      /*
      activitywatch = {
        description = "Start ActivityWatch";
        wantedBy = ["graphical-session.target"];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.aw-server-rust}/bin/aw-server";
          Restart = "on-failure";
          RestartSec = 5;
        };
      };

      activitywatch-afk = {
        description = "Start ActivityWatch AFK";
        wantedBy = ["graphical-session.target"];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.activitywatch}/bin/aw-watcher-afk";
          Restart = "on-failure";
          RestartSec = 5;
        };
      };

      activitywatch-window = {
        description = "Start ActivityWatch Window";
        wantedBy = ["graphical-session.target"];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.activitywatch}/bin/aw-watcher-window";
          Restart = "on-failure";
          RestartSec = 5;
        };
      };
      */

      /*
      polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        wantedBy = ["xdg-desktop-portal.service"];
        wants = ["xdg-desktop-portal.service"];
        after = ["xdg-desktop-portal.service"];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
      */

      # <https://github.com/nix-community/nur-combined/blob/master/repos/xddxdd/pkgs/uncategorized/flaresolverr-21hsmw/default.nix>
      /*
      flaresolverr = {
        after = ["network.target"];
        environment = {
          LOG_LEVEL = "info";
          LOG_HTML = "false";
          CAPTCHA_SOLVER = "hcaptcha-solver";
          TZ = "Asia/Dhaka";
        };
        serviceConfig = {
          User = config.services.jackett.user;
          Group = config.services.jackett.group;
          Restart = "always";
          RestartSec = 5;
          TimeoutStopSec = 30;
          ExecStart = "${pkgs.nur.repos.xddxdd.flaresolverr-21hsmw}/bin/flaresolverr";
        };
        wantedBy = ["multi-user.target"];
      };
      */
    };
  };
}
