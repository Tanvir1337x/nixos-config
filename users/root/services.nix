# Services Configuration
{
  pkgs,
  lib,
  ...
}: {
  # For programs like gparted (that requires root permission) to work
  # <https://wiki.nixos.org/wiki/Polkit>
  security.polkit.enable = true;

  services = {
    #- <https://wiki.nixos.org/wiki/BOINC>
    /*
    boinc = {
      enable = true;
      dataDir = "/var/lib/boinc"; # use with boincmgr --datadir /var/lib/boinc
    };
    */

    earlyoom = {
      enable = true;
      enableNotifications = true;
      freeMemThreshold = 3;
      freeSwapThreshold = 9;
    };

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

    # <https://wiki.nixos.org/wiki/Nginx>
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
        # TODO: Enable HTTPS support for SearXNG
        "searxng.local" = {
          # enableACME = true;
          # forceSSL = true;
          # sslCertificate = "/home/user/certs/self-signed.crt";
          # sslCertificateKey = "/home/user/certs/self-signed.key";

          listen = [
            {
              addr = "127.0.0.1";
              port = 80;
              # ssl = false;
            }
            /*
            {
              addr = "127.0.0.1";
              port = 443;
              ssl = true;
            }
            */
          ];

          locations."/" = {
            proxyPass = "http://127.0.0.1:9999";
          };

          locations."/robots.txt" = {
            extraConfig = ''
              rewrite ^/(.*)  $1;
              return 200 "User-agent: *\nDisallow: /";
            '';
          };

          /*
          extraConfig = ''
            "proxy_ssl_server_name on;"
            "proxy_pass_header Authorization;"
          '';
          */
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

          locations."/robots.txt" = {
            extraConfig = ''
              rewrite ^/(.*)  $1;
              return 200 "User-agent: *\nDisallow: /";
            '';
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

          locations."/robots.txt" = {
            extraConfig = ''
              rewrite ^/(.*)  $1;
              return 200 "User-agent: *\nDisallow: /";
            '';
          };
        };

        # Flaresolverr Instance
        "flaresolverr.local" = {
          listen = [
            {
              addr = "127.0.0.1";
              port = 80;
            }
          ];

          locations."/" = {
            proxyPass = "http://127.0.0.1:8191";
          };

          locations."/robots.txt" = {
            extraConfig = ''
              rewrite ^/(.*)  $1;
              return 200 "User-agent: *\nDisallow: /";
            '';
          };
        };

        # IPFS Instance
        "ipfs.local" = {
          listen = [
            {
              addr = "127.0.0.1";
              port = 80;
            }
          ];

          locations."/" = {
            proxyPass = "http://127.0.0.1:5001/webui/";

            extraConfig = ''
              proxy_http_version 1.1;
              proxy_set_header Host $host;
              proxy_set_header X-Real-IP $remote_addr;
              proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
              proxy_set_header Upgrade $http_upgrade;
              proxy_set_header Connection "upgrade";
              proxy_redirect off;
            '';
          };

          locations."/api/v0/" = {
            proxyPass = "http://127.0.0.1:5001/api/v0/";

            extraConfig = ''
              proxy_http_version 1.1;
              proxy_set_header Host $host;
              proxy_set_header X-Real-IP $remote_addr;
              proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
              proxy_set_header Upgrade $http_upgrade;
              proxy_set_header Connection "upgrade";
              proxy_redirect off;
            '';
          };

          locations."/ipfs/" = {
            proxyPass = "http://127.0.0.1:8080/ipfs/";

            extraConfig = ''
              proxy_set_header Host $host;
              proxy_set_header X-Real-IP $remote_addr;
              proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
              proxy_redirect off;
            '';
          };

          locations."/ipns/" = {
            proxyPass = "http://127.0.0.1:8080/ipns/";

            extraConfig = ''
              proxy_set_header Host $host;
              proxy_set_header X-Real-IP $remote_addr;
              proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
              proxy_redirect off;
            '';
          };

          locations."/robots.txt" = {
            extraConfig = ''
              return 200 "User-agent: *\nDisallow: /";
            '';
          };
        };

        # Uptime-Kuma Instance
        "uptimekuma.local" = {
          listen = [
            {
              addr = "127.0.0.1";
              port = 80;
            }
          ];

          locations."/" = {
            proxyPass = "http://127.0.0.1:2120";
          };

          locations."/robots.txt" = {
            extraConfig = ''
              rewrite ^/(.*)  $1;
              return 200 "User-agent: *\nDisallow: /";
            '';
          };
        };

        # Stirling-PDF Instance
        "stirlingpdf.local" = {
          listen = [
            {
              addr = "127.0.0.1";
              port = 80;
            }
          ];

          locations."/" = {
            proxyPass = "http://127.0.0.1:8310";
          };

          locations."/robots.txt" = {
            extraConfig = ''
              rewrite ^/(.*)  $1;
              return 200 "User-agent: *\nDisallow: /";
            '';
          };
        };

        # Netdata Instance
        "netdata.local" = {
          listen = [
            {
              addr = "127.0.0.1";
              port = 80;
            }
          ];

          locations."/" = {
            proxyPass = "http://127.0.0.1:9822";
          };

          locations."/robots.txt" = {
            extraConfig = ''
              rewrite ^/(.*)  $1;
              return 200 "User-agent: *\nDisallow: /";
            '';
          };
        };

        # Casa Instance
        "casa.local" = {
          listen = [
            {
              addr = "127.0.0.1";
              port = 80;
            }
          ];

          locations."/" = {
            proxyPass = "http://127.0.0.1:9341";
          };

          locations."/robots.txt" = {
            extraConfig = ''
              rewrite ^/(.*)  $1;
              return 200 "User-agent: *\nDisallow: /";
            '';
          };
        };

        # Umbrel Instance
        "umbrel.local" = {
          listen = [
            {
              addr = "127.0.0.1";
              port = 80;
            }
          ];

          locations."/" = {
            proxyPass = "http://127.0.0.1:9342";
          };

          locations."/robots.txt" = {
            extraConfig = ''
              rewrite ^/(.*)  $1;
              return 200 "User-agent: *\nDisallow: /";
            '';
          };
        };

        # Cosmos Instance
        "cosmos.local" = {
          listen = [
            {
              addr = "127.0.0.1";
              port = 80;
            }
            {
              addr = "127.0.0.1";
              port = 443;
            }
          ];

          locations."/" = {
            proxyPass = "http://127.0.0.1:9343";
          };

          extraConfig = ''
            proxy_http_version 1.1;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "upgrade";
            proxy_redirect off;
          '';

          locations."/robots.txt" = {
            extraConfig = ''
              rewrite ^/(.*)  $1;
              return 200 "User-agent: *\nDisallow: /";
            '';
          };
        };

        # Zeronet (zeronet-conservancy) Instance
        "zeronet.local" = {
          listen = [
            {
              addr = "127.0.0.1";
              port = 80;
            }
          ];

          # <https://zeronet.readthedocs.io/en/latest/faq/#how-to-configure-nginx-reverse-proxy-for-zeronet>
          locations."/" = {
            proxyPass = "http://127.0.0.1:43110";

            extraConfig = ''
              proxy_http_version 1.1;
              proxy_set_header Host $host;
              proxy_read_timeout 1h;
              proxy_set_header Upgrade $http_upgrade;
              proxy_set_header Connection "upgrade";
            '';
          };

          locations."/robots.txt" = {
            extraConfig = ''
              rewrite ^/(.*)  $1;
              return 200 "User-agent: *\nDisallow: /";
            '';
          };
        };
      };
    };

    netdata = {
      enable = true;
      enableAnalyticsReporting = false;

      config = {
        global = {
          "default port" = "9822";
          "bind to" = "*";
          "history" = "604800"; # 7 days
          "error log" = "syslog";
          "debug log" = "syslog";
          "access log" = "syslog";
        };
      };

      python = {
        enable = true;
        extraPackages = p: [
          p.docker
          p.dnspython
        ];
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
          "presearch".disabled = true;
          "presearch videos".disabled = true;
          "qwant".disabled = false;
          "startpage".disabled = false;
          "wiby".disabled = true;
          "yahoo".disabled = false;
          "seznam".disabled = true;
          "goo".disabled = true;
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
          "curlie".disabled = true;
          "currency".disabled = false;
          "ddg definitions".disabled = false;
          "encyclosearch".disabled = true;
          "mwmbl".disabled = false;
          "right dao".disabled = false;
          "searchmysite".disabled = false;
          "stract".disabled = true;
          "tineye".disabled = false;
          "wikidata".disabled = false;
          "wikipedia".disabled = false;
          "wolframalpha".disabled = true;
          "yacy".disabled = true;
          "yep".disabled = true;
          "bpb".disabled = true;
          "tagesschau".disabled = false;
          "wikimini".disabled = true;

          # Images
          #- Web
          "bing images".disabled = false;
          "brave.images".disabled = false;
          "duckduckgo images".disabled = false;
          "google images".disabled = false;
          "mojeek images".disabled = false;
          "presearch images".disabled = true;
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
          "yacy images".disabled = true;
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
          "presearch news".disabled = true;
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
          "openlibrary".disabled = false;
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

    uptime-kuma = {
      enable = true;
      appriseSupport = true;

      settings = {
        PORT = "2120";
      };
    };

    stirling-pdf = {
      enable = true;

      environment = {
        INSTALL_BOOK_AND_ADVANCED_HTML_OPS = "true";
        SERVER_PORT = 8310;
      };
    };

    teamviewer.enable = false;
    vnstat.enable = true;

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
      openFirewall = true;
      # Use flaresolverr-21hsmw temporarily as the original package is broken
      # Tracking: <https://github.com/NixOS/nixpkgs/issues/332776>,
      # <https://github.com/FlareSolverr/FlareSolverr/issues/1318>
      # and <https://github.com/NixOS/nixpkgs/pull/353885>
      # TODO: Switch back to the original package once upstream fixes the issue
      package = pkgs.nur.repos.xddxdd.flaresolverr-21hsmw;
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

    fstrim = {
      enable = true;
      interval = "weekly";
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
    keybase.enable = true;
    kbfs = {
      enable = true;
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
    # Default data dir: /var/lib/ipfs/
    kubo = {
      enable = true;
      defaultMode = "online";
      startWhenNeeded = false;
      emptyRepo = true;
      autoMount = true; # /ipfs and /ipns
      autoMigrate = true;
      localDiscovery = false; # Disable as some hosting services will ban you if enabled
      enableGC = true; # Garbage collection

      settings = {
        Addresses.API = "/ip4/127.0.0.1/tcp/5001"; # WebUI: <http://127.0.0.1:5001/webui>
        Addresses.Gateway = "/ip4/127.0.0.1/tcp/8080";

        API = {
          HTTPHeaders = {
            "Access-Control-Allow-Origin" = [
              # "http://127.0.0.1:5001"
              # "http://localhost:3000"
              # "http://ipfs.local"
              # "https://webui.ipfs.io"
              "*" # Allow all origins
            ];

            "Access-Control-Allow-Methods" = ["PUT" "POST"];
            "Access-Control-Allow-Credentials" = ["true"];
            /*
            "Access-Control-Allow-Headers" = [
              "Authorization"
            ];
            */
          };
        };
      };
    };

    #- <https://wiki.nixos.org/wiki/Tor>
    # Default Ports: 9050, 9063, 8118
    tor = {
      enable = false;
      client.enable = true;
      torsocks.enable = true;
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
      Bridge = "obfs4 IP:ORPort [fingerprint]";
      */
    };

    # Downloads dir: /var/lib/freenet/.local/share/freenet/./downloads
    freenet.enable = false; # WebUI: <http://localhost:8888>

    # As of 06/12/2024 the service seems to be broken
    # When visiting the WebUI, it's stuck on "Connecting...", "No peers found", "content.json download failed"
    # Default data dir: /var/lib/zeronet/
    zeronet = {
      enable = true;
      #- <https://github.com/NixOS/nixpkgs/pull/173900>
      package = pkgs.zeronet-conservancy-legacy; # maintained community fork of zeronet
      # port = 7110; # default: 43110
      # fileserverPort = 7111; # default: 26552
      tor = false; # Only use Tor for Tor network peers
      torAlways = false; # Use Tor for every connections to hide your IP address (slower)
      # settings = {
      #  global.ui_ip = "*";
      #  global.ui_host = "*";
      # };
    };

    # https://wiki.nixos.org/wiki/SSH_public_key_authentication
    openssh = {
      enable = false;
      allowSFTP = false;
      settings = {
        passwordAuthentication = true; # setting it to false requires public key authentication for better security
        challengeResponseAuthentication = true;
        kbdInteractiveAuthentication = false;
        PermitRootLogin = "yes";
        AllowTcpForwarding = "yes";
        X11Forwarding = "yes";
        AllowAgentForwarding = "yes";
        AllowStreamLocalForwarding = "yes";
        # AuthenticationMethods = "publickey";
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

    snowflake-proxy.enable = true;

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

    # <https://wiki.nixos.org/wiki/VR#WiVRn>
    wivrn = {
      enable = false;
      openFirewall = true;

      # Write information to /etc/xdg/openxr/1/active_runtime.json, VR applications
      # will automatically read this and work with WiVRn (Note: This does not currently
      # apply for games run in Valve's Proton)
      defaultRuntime = true;

      # Run WiVRn as a systemd service on startup
      autoStart = true;

      # Config for WiVRn (https://github.com/WiVRn/WiVRn/blob/master/docs/configuration.md)
      config = {
        enable = true;
        json = {
          scale = 1.0; # 1.0x foveation scaling
          bitrate = 100000000; # 100 Mb/s
          encoders = [
            {
              encoder = "vaapi";
              codec = "h265";
              # 1.0 x 1.0 scaling
              width = 1.0;
              height = 1.0;
              offset_x = 0.0;
              offset_y = 0.0;
            }
          ];
        };
      };
    };
  };
}
