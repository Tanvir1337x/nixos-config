# Services Configuration
{pkgs, ...}: {
  # For programs like gparted (that requires root permission) to work
  # <https://wiki.nixos.org/wiki/Polkit>
  security.polkit.enable = true;

  # Disable as it slows down the boot time
  systemd.services.NetworkManager-wait-online.enable = false;

  systemd.user.services = {
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

    # <https://github.com/nix-community/nur-combined/blob/master/repos/xddxdd/pkgs/uncategorized/flaresolverr/default.nix>
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
        ExecStart = "${pkgs.nur.repos.xddxdd.flaresolverr}/bin/flaresolverr";
      };
      wantedBy = ["multi-user.target"];
    };
    */
  };

  services = {
    #- <https://wiki.nixos.org/wiki/BOINC>
    /*
    boinc = {
      enable = true;
      dataDir = "/var/lib/boinc"; # use with boincmgr --datadir /var/lib/boinc
    };
    */

    logind = {
      powerKey = "poweroff";
      powerKeyLongPress = "reboot";
      rebootKey = "reboot";
      rebootKeyLongPress = "poweroff";

      suspendKey = "suspend";
      suspendKeyLongPress = "hibernate";
      lidSwitch = "suspend-then-hibernate";
    };

    #- <https://wiki.nixos.org/wiki/SearXNG>
    searx = {
      enable = true;
      package = pkgs.searxng;
      # <https://searx.github.io/searx/admin/settings.html>
      settings = {
        # Server settings
        server = {
          port = 9999;
          bind_address = "127.0.0.1";
          secret_key = "ultrasecretkeylol";
          image_proxy = true;
          default_locale = "en";
          # default_theme = "oscar";
        };

        outgoing = {
          request_timeout = 3.0; # Timeout in seconds for requests
          max_request_timeout = 5.8; # Maximum timeout in seconds for requests
        };

        # Instance settings
        general = {
          debug = false; # Debug mode is only for development
          instance_name = "SearXNG Instance";
          donation_url = false;
          contact_url = false;
          privacypolicy_url = false;
          enable_metrics = false;
        };
      };

      redisCreateLocally = false; # Disable as I don't need rate limiter and bot protection of SearXNG
      # Recommended mode for public or large instances
      runInUwsgi = false; # Disable as it's unnecessary for LAN or local-only use
    };

    teamviewer.enable = false;
    vnstat.enable = true;
    fstrim.enable = false;

    /*
    atuin = {
      enable = false;
      maxHistoryLength = 100000;
      host = "127.0.0.1";
      package = pkgs.atuin;
      database.createLocally = true;
      openRegistration = true;
      openFirewall = true;
    };
    */

    # Compositor for X11
    # picom.enable = true;

    # Aria2 daemon can be controlled via the RPC interface using
    # one of many WebUI
    # WebUI (default): <http://localhost:6800>
    aria2 = {
      enable = false;
      openPorts = true;
      rpcSecretFile = "/run/secrets/aria2-rpc-token.txt";

      settings = {
        # dir = "/aria2/downloads";
        enable-rpc = true;
        rpc-listen-port = 6800;
        # listen-port (from = 6881; to = 6999;)
      };
    };

    # FlareSolverr: <https://github.com/FlareSolverr/FlareSolverr>
    flaresolverr = {
      enable = true;
      port = 8191;
      # openFirewall = true;
    };

    # USB Automounting
    # <https://wiki.nixos.org/wiki/PCManFM#USB_Automounting>
    udisks2.enable = true;
    devmon.enable = true;

    gnome.gnome-keyring.enable = true; # Keyring for SSH
    blueman.enable = true; # GUI Bluetooth Manager
    cpupower-gui.enable = false; # GUI for CPU power management
    packagekit.enable = false; # Required for KDE Discover

    # <https://wiki.nixos.org/wiki/Btrfs#Scrubbing>
    btrfs.autoScrub = {
      enable = true;
      interval = "monthly";
      fileSystems = ["/"];
    };

    # zfs.autoScrub.enable = true;

    # [2024-07-15] xmr-stak has been removed from nixpkgs because it was broken
    # <https://github.com/NixOS/nixpkgs/pull/327288>
    /*
    xmr-stak = {
      enable = false;
      openclSupport = false;
      # cudaSupport = true;
    };
    */

    xmrig = {
      enable = false;
      package = pkgs.xmrig-mo;
      settings = builtins.fromJSON (builtins.readFile ../../configs/monero.json);
    };

    syncthing = {
      enable = false; # WebUI (Default): <http://localhost:8384>
      # user = "user";
      # guiAddress = "127.0.0.1:9999";
    };

    # Keybase
    keybase.enable = false;
    kbfs = {
      enable = false;
      enableRedirector = false;
      mountPoint = "%h/keybase";
      extraFlags = [
        "-label kbfs"
      ];
    };

    # K3s
    #- <https://wiki.nixos.org/wiki/K3s>
    k3s = {
      enable = false;
      role = "server";
    };

    # TODO: tor, i2p, lokinet, freenet, gnunet

    # IPFS
    #- <https://wiki.nixos.org/wiki/IPFS>
    kubo = {
      enable = false;
      defaultMode = "online";
      startWhenNeeded = false;
      autoMount = true; # /ipfs and /ipns
      autoMigrate = true;
      enableGC = true; # Garbage collection
      settings.Addresses.API = "/ip4/127.0.0.1/tcp/5001"; # WebUI: <http://127.0.0.1:5001/webui>
      # Default data dir: /var/lib/ipfs/
    };

    #- <https://wiki.nixos.org/wiki/Tor>
    tor = {
      enable = false;
      client.enable = true;
      openFirewall = true;

      relay = {
        enable = true;
        role = "relay";
      };

      settings = {
        ORPort = 9001;
        ControlPort = 9051;
        BandWidthRate = "100 MBytes";
      };

      /*
      UseBridges = true;
      ClientTransportPlugin = "obfs4 exec ${pkgs.obfs4}/bin/obfs4proxy";
      Bridge = "obfs4 IP:ORPort [fingerprint]"
      */
    };

    # Downloads dir: /var/lib/freenet/.local/share/freenet/./downloads
    freenet.enable = false; # WebUI: <http://localhost:8888>

    zeronet = {
      enable = false;
      #- <https://github.com/NixOS/nixpkgs/pull/173900>
      package = pkgs.zeronet-conservancy; # maintained community fork of zeronet
      # port = 7110; # default: 43110
      # fileserverPort = 7111; # default: 12261
      # tor = true; # Only use Tor for Tor network peers
      # torAlways = false; # Use Tor for every connections to hide your IP address (slower)
      # Default data dir: /var/lib/zeronet/
    };

    # https://wiki.nixos.org/wiki/SSH_public_key_authentication
    openssh = {
      enable = false;
      settings = {
        passwordAuthentication = true; # setting it to false requires public key authentication for better security
        kbdInteractiveAuthentication = false;
        PermitRootLogin = "yes";
      };
    };

    # TODO: portmaster <https://github.com/NixOS/nixpkgs/pull/264454>

    mpd = {
      enable = false; # Music Player Daemon
      startWhenNeeded = true;
    };

    ympd.enable = false; # WebUI for MPD. <http://localhost:6600>

    # For thunar
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images

    # DBus service that allows applications to update firmware
    # <https://wiki.nixos.org/wiki/Fwupd>
    fwupd.enable = false;

    /*
    deluge = {
      enable = true;
      web.enable = true;
    };
    */

    #- <https://usbguard.github.io>
    /*
    usbguard = {
      enable = true;
      dbus.enable = true;
      implicitPolicyTarget = "block";
      # change {id} to trusted USB device, (find ids using lsusb)
      rules = ''
        allow id {id} # device 1
        allow id {id} # device 2
      '';
    };
    */

    mullvad-vpn.enable = false;

    snowflake-proxy.enable = false;

    # TODO: Setup sonarr, radarr, prowlarr, lidarr, readarr, bazarr, whisparr, exportarr, plex, kodi, ombi,
    # jellyseerr, overseerr
    # stash (https://hub.docker.com/r/stashapp/stash)
    # <https://wiki.servarr.com>
    # <https://trash-guides.info/>
    # <https://github.com/Ravencentric/awesome-arr>

    # TODO: setup Jellyfin
    #- <https://wiki.nixos.org/wiki/Jellyfin>
    #- <https://jellyfin.org>
    #- <https://github.com/jellyfin/jellyfin-media-player>
    # services.jellyfin.enable = true;

    # TODO: SABnzbd, Spacedrive (https://www.spacedrive.com)

    # TODO: setup PhotoPrism
    #- <https://wiki.nixos.org/wiki/PhotoPrism>

    # <https://github.com/Jackett/Jackett>
    # Use <https://github.com/FlareSolverr/FlareSolverr> in addition
    # Tracking: <https://github.com/NixOS/nixpkgs/issues/294789>
    jackett.enable = true; # WebUI: http://127.0.0.1:9117

    # <https://wiki.nixos.org/wiki/GNOME#Running_ancient_applications>
    dbus.packages = with pkgs; [gnome2.GConf];

    # Automatically lock the screen after a period of inactivity
    xserver.xautolock = {
      enable = false;
      enableNotifier = true;
      time = 10; # in minutes
      notify = 10; # in seconds
      killtime = 120; # in minutes
      locker = "${pkgs.i3lock-fancy-rapid}/bin/i3lock-fancy-rapid 5 5";
      notifier = "${pkgs.libnotify}/bin/notify-send 'Locking in 10 seconds'";
      # killer = "/run/current-system/systemd/bin/systemctl suspend";
    };
  };

  # To avoid system freeze
  systemd.oomd.enable = true;
  services.earlyoom = {
    enable = true;
    enableNotifications = true;
    freeMemThreshold = 3;
    freeSwapThreshold = 9;
  };
}
