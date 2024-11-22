# Services Configuration
{
  pkgs,
  lib,
  ...
}: {
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

    smartd = {
      enable = true;
      autodetect = true;
      notifications.systembus-notify.enable = true;

      /*
      devices = [
        {
          device = "/dev/sda";
          options = "-d ata";
        }
        {
          device = "/dev/sdb";
          options = "-d ata";
        }
        {
          device = "/dev/sdc";
          options = "-d ata";
        }
        {
          device = "/dev/sdd";
          options = "-d ata";
        }
        {
          device = "/dev/nvme0";
        }
      ];
      */
    };

    nginx = {
      enable = true;
      recommendedOptimisation = true;
      recommendedTlsSettings = true;
      recommendedZstdSettings = true;
      recommendedGzipSettings = true;
      # recommendedProxySettings = true;
      recommendedBrotliSettings = true;
      virtualHosts = {
        # SearXNG Instance
        "searxng.local" = {
          listen = [
            {
              addr = "127.0.0.1";
              port = 80;
            }
          ];
          locations."/" = {
            proxyPass = "http://127.0.0.1:9999";
          };
        };

        # ActivityWatch Instance
        "activitywatch.local" = {
          listen = [
            {
              addr = "127.0.0.1";
              port = 80;
            }
          ];
          locations."/" = {
            proxyPass = "http://127.0.0.1:5600";
          };
        };

        # Jackett Instance
        "jackett.local" = {
          listen = [
            {
              addr = "127.0.0.1";
              port = 80;
            }
          ];
          locations."/" = {
            proxyPass = "http://127.0.0.1:9117";
          };
        };
      };
    };

    #- <https://wiki.nixos.org/wiki/SearXNG>
    # <https://docs.searxng.org>
    searx = {
      enable = true;
      package = pkgs.searxng;
      # <https://docs.searxng.org/admin/settings/index.html>
      settings = {
        default_doi_resolver = "doi.org";

        # Server settings
        server = {
          port = 9999;
          bind_address = "127.0.0.1";
          secret_key = "ultrasecretkeylol";
          base_url = "http://searxng.local";
          http_protocol_version = "1.1"; # 1.0 and 1.1 are supported
          method = "GET"; # GET is generally faster and more efficient due to caching and simpler processing
          image_proxy = true;
          default_locale = "en";
          limiter = false;
          public_instance = false;
        };

        # Outgoing requests
        outgoing = {
          request_timeout = 8.0; # Timeout in seconds for requests
          max_request_timeout = 15.5; # Maximum timeout in seconds for requests
          keepalive_expiry = 10.0; # in seconds
          pool_connections = 10;
          pool_maxsize = 5;
          enable_http2 = true;
          max_redirects = 50;
          using_tor_proxy = false;
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

        ui = {
          default_locale = "en";
          static_use_hash = true;
          query_in_title = true;
          infinite_scroll = true;
          center_alignment = true;
          results_on_new_tab = true;
          search_on_category_select = true;
          hotkeys = "default";
          default_theme = "simple";
          theme_args.simple_style = "dark";
        };

        redis = {
          url = false;
        };

        enabled_plugins = [
          "Basic Calculator"
          "Hash plugin"
          "Tor check plugin"
          "Open Access DOI rewrite"
          "Hostnames plugin"
          "Unit converter plugin"
          "Tracker URL remover"
        ];

        search = {
          safe_search = 0; # 0: None, 1: Moderate, 2: Strict
          autocomplete = "google";
          favicon_resolver = "google"; # Leaving it blank turns it off
          autocomplete_min = 2;
          default_lang = "all";
          max_page = 0; # Unlimited number of pages
          ban_time_on_fail = 6.0; # in seconds
          max_ban_time_on_fail = 25.0; # in seconds
          formats = [
            "html"
            "csv"
            "json"
            "rss"
          ];
        };

        # Search engines
        # 1: Standard weight
        # Weight > 1: Will give more importance to the search engine
        # Weight < 1: Will give less importance to the search engine
        # TODO: Setup yandex web and image search, perplexity, phind, kagi, searchcivitai, ecosia, saucenao, swisscows
        engines = lib.mapAttrsToList (name: value: {inherit name;} // value) {
          # General
          #- Translate
          "dictzone".disabled = false;
          "libretranslate".disabled = false;
          "lingva".disabled = false;
          "mozhi".disabled = false;
          "mymemory translated".disabled = false;
          #- Web
          "bing".disabled = false;
          "bing".weight = 6.0;
          "brave".disabled = false;
          "brave".weight = 9.5;
          "duckduckgo".disabled = false;
          "duckduckgo".weight = 8.0;
          "google".disabled = false;
          "google".weight = 10.0;
          "mojeek".disabled = false;
          "presearch".disabled = false;
          "presearch videos".disabled = false;
          "qwant".disabled = false;
          "startpage".disabled = false;
          "wiby".disabled = false;
          "yahoo".disabled = false;
          "seznam".disabled = false;
          "goo".disabled = false;
          "naver".disabled = false;
          #- Wikimedia
          "wikibooks".disabled = false;
          "wikiquote".disabled = false;
          "wikisource".disabled = false;
          "wikispecies".disabled = false;
          "wikiversity".disabled = false;
          "wikivoyage".disabled = false;
          #- Without further subgrouping
          "ask".disabled = false;
          "cloudflareai".disabled = true;
          "crowdview".disabled = false;
          "curlie".disabled = false;
          "currency".disabled = false;
          "ddg definitions".disabled = false;
          "encyclosearch".disabled = false;
          "mwmbl".disabled = false;
          "right dao".disabled = false;
          "searchmysite".disabled = false;
          "stract".disabled = false;
          "tineye".disabled = false;
          "wikidata".disabled = false;
          "wikipedia".disabled = false;
          "wolframalpha".disabled = false;
          "yacy".disabled = false;
          "yep".disabled = true;
          "bpb".disabled = false;
          "tagesschau".disabled = false;
          "wikimini".disabled = true;

          # Images
          #- Web
          "bing images".disabled = false;
          "brave.images".disabled = false;
          "duckduckgo images".disabled = false;
          "google images".disabled = false;
          "mojeek images".disabled = false;
          "presearch images".disabled = false;
          "qwant images".disabled = false;
          #- Without further subgrouping
          "1x".disabled = false;
          "artic".disabled = false;
          "deviantart".disabled = false;
          "findthatmeme".disabled = false;
          "flickr".disabled = false;
          "frinkiac".disabled = false;
          "imgur".disabled = false;
          "library of congress".disabled = false;
          "material icons".disabled = false;
          "openverse".disabled = false;
          "pinterest".disabled = false;
          "svgrepo".disabled = false;
          "unsplash".disabled = false;
          "wallhaven".disabled = false;
          "wikicommons.images".disabled = false;
          "yacy images".disabled = false;
          "yep images".disabled = false;
          "seekr images".disabled = false;

          # Videos
          #- Web
          "bing videos".disabled = false;
          "brave.videos".disabled = false;
          "duckduckgo videos".disabled = false;
          "google videos".disabled = false;
          "qwant videos".disabled = false;
          #- Without further subgrouping
          "bilibili".disabled = false;
          "dailymotion".disabled = false;
          "google play movies".disabled = false;
          "invidious".disabled = false;
          "livespace".disabled = false;
          "media.ccc.de".disabled = false;
          "odysee".disabled = false;
          "peertube".disabled = false;
          "piped".disabled = false;
          "rumble".disabled = false;
          "sepiasearch".disabled = false;
          "vimeo".disabled = false;
          "wikicommons.videos".disabled = false;
          "youtube".disabled = false;
          "mediathekviewweb".disabled = false;
          "seekr videos".disabled = false;
          "ina".disabled = false;

          # News
          #- Web
          "duckduckgo news".disabled = false;
          "mojeek news".disabled = false;
          "presearch news".disabled = false;
          #- Wikimedia
          "wikinews".disabled = false;
          #- Without further subgrouping
          "bing news".disabled = false;
          "brave.news".disabled = false;
          "google news".disabled = false;
          "qwant news".disabled = false;
          "yahoo news".disabled = false;
          "yep news".disabled = false;
          # "tagesschau".disabled = false;
          "seekr news".disabled = false;

          # Map
          "apple maps".disabled = false;
          "openstreetmap".disabled = false;
          "photon".disabled = false;

          # Music
          #- Lyrics
          "genius".disabled = false;
          #- Radio
          "radio browser".disabled = false;
          #- Without further subgrouping
          "bandcamp".disabled = false;
          "deezer".disabled = false;
          # "invidious".disabled = false;
          "mixcloud".disabled = false;
          "piped.music".disabled = false;
          "soundcloud".disabled = false;
          "wikicommons.audio".disabled = false;
          # "youtube".disabled = false;

          # IT
          #- Packages
          "alpine linux packages".disabled = false;
          "crates.io".disabled = false;
          "docker hub".disabled = false;
          "hex".disabled = false;
          "hoogle".disabled = false;
          "lib.rs".disabled = false;
          "metacpan".disabled = false;
          "npm".disabled = false;
          "packagist".disabled = false;
          "pkg.go.dev".disabled = false;
          "pub.dev".disabled = false;
          "pypi".disabled = false;
          "rubygems".disabled = false;
          "voidlinux".disabled = false;
          #- Q&A
          "askubuntu".disabled = false;
          "caddy.community".disabled = false;
          "discuss.python".disabled = false;
          "pi-hole.community".disabled = false;
          "stackoverflow".disabled = false;
          "superuser".disabled = false;
          #- Repos
          "bitbucket".disabled = false;
          "codeberg".disabled = false;
          "gitea.com".disabled = false;
          "github".disabled = false;
          "gitlab".disabled = false;
          "sourcehut".disabled = false;
          #- Software Wikis
          "arch linux wiki".disabled = false;
          "free software directory".disabled = false;
          "gentoo".disabled = false;
          #- Without further subgrouping
          "anaconda".disabled = false;
          "cppreference".disabled = false;
          "habrahabr".disabled = false;
          "hackernews".disabled = false;
          "lobste.rs".disabled = false;
          "mankier".disabled = false;
          "mdn".disabled = false;
          "searchcode code".disabled = false;

          # Science
          #- Scientific publications
          "arxiv".disabled = false;
          "crossref".disabled = false;
          "google scholar".disabled = false;
          "internetarchivescholar".disabled = false;
          "pubmed".disabled = false;
          "semantic scholar".disabled = false;
          #- Wikimedia
          # "wikispecies".disabled = false;
          #- Without further subgrouping
          "openairedatasets".disabled = false;
          "openairepublications".disabled = false;
          "pdbe".disabled = false;

          # Files
          #- Apps
          "apk mirror".disabled = false;
          "apple app store".disabled = false;
          "fdroid".disabled = false;
          "google play apps".disabled = false;
          # Without further subgrouping
          "1337x".disabled = false;
          "annas archive".disabled = false;
          "bt4g".disabled = false;
          "btdigg".disabled = false;
          "kickass".disabled = false;
          "library genesis".disabled = false;
          "nyaa".disabled = false;
          "openrepos".disabled = false;
          "piratebay".disabled = false;
          "solidtorrents".disabled = false;
          "tokyotoshokan".disabled = false;
          "wikicommons.files".disabled = false;
          "z-library".disabled = false;

          # Social Media
          "9gag".disabled = false;
          "lemmy comments".disabled = false;
          "lemmy communities".disabled = false;
          "lemmy posts".disabled = false;
          "lemmy users".disabled = false;
          "mastodon hashtags".disabled = false;
          "mastodon users".disabled = false;
          "reddit".disabled = false;
          "tootfinder".disabled = false;

          # Other
          #- Dictionaries
          "etymonline".disabled = false;
          "wiktionary".disabled = false;
          "wordnik".disabled = false;
          "duden".disabled = false;
          "woxikon.de synonyme".disabled = false;
          "jisho".disabled = false;
          "sjp.pwn".disabled = false;
          #- Movies
          "imdb".disabled = false;
          "rottentomatoes".disabled = false;
          "tmdb".disabled = false;
          "moviepilot".disabled = false;
          #- Shopping
          "geizhals".disabled = false;
          #- Weather
          "duckduckgo weather".disabled = false;
          "openmeteo".disabled = false;
          "wttr.in".disabled = false;
          #- Without further subgrouping
          "emojipedia".disabled = false;
          "erowid".disabled = false;
          "fyyd".disabled = false;
          "goodreads".disabled = false;
          "podcastindex".disabled = false;
          "yummly".disabled = false;
          "chefkoch".disabled = false;
          "destatis".disabled = false;
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
      openPorts = false;
      # Irrelevant, we are protected by HTTP authentication
      rpcSecretFile = pkgs.writeText "secret" "aria2rpc";

      settings = {
        enable-rpc = true;
        rpc-listen-port = 6800;
        dir = "/home/user/downloads/aria2";
        listen-port = []; # UDP listening port range used by DHT(IPv4, IPv6) and UDP tracker
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
    blueman.enable = false; # GUI Bluetooth Manager
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
