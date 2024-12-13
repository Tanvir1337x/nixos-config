# Programs Configuration
{pkgs, ...}: {
  programs = {
    # <https://nixos.wiki/wiki/Gamemode>
    gamemode = {
      enable = true;
      enableRenice = true;
      settings.general.inhibit_screensaver = 0;
    };

    partition-manager.enable = true;

    # Plotinus GTK 3 plugin
    plotinus.enable = true;

    # Conflicts `programs.command-not-found.enable` | `programs.nix-index`. Only one among those.
    command-not-found.enable = false; # Doesn't work without channels
    nix-index = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };

    java = {
      enable = false;
      package = pkgs.openjdk;
      binfmt = true; # Needed to execute java jar’s and classes
    };

    wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };

    steam = {
      enable = true;
      protontricks.enable = true;
      extest.enable = false; # For wayland

      package = pkgs.steam.override {
        /*
        withJava = true;
        withPrimus = true;
        extraPackages = with pkgs; [ bumblebee glxinfo ];
        */
        extraEnv = {
          MANGOHUD = true;
          OBS_VKCAPTURE = true;
          RADV_TEX_ANISO = 16;
        };

        extraLibraries = p:
          with p; [
            atk
          ];
      };

      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };

    xonsh.enable = true;

    # <https://wiki.nixos.org/wiki/Bash>
    bash = {
      completion.enable = true;
      enableLsColors = true;
      blesh.enable = false;
    };

    fish = {
      enable = true;
      useBabelfish = true;

      vendor = {
        config.enable = true;
        completions.enable = true;
        functions.enable = true;
      };
    };

    # <https://wiki.nixos.org/wiki/Zsh>
    zsh = {
      enable = true;
      enableCompletion = true;
      enableBashCompletion = true;
      syntaxHighlighting.enable = true;

      autosuggestions = {
        enable = true;
        strategy = ["completion"];
      };

      ohMyZsh = {
        enable = true;
        plugins = ["git" "man"];
        theme = "cypher";
      };
    };

    # Necessary
    # Gnome: <https://wiki.nixos.org/wiki/GNOME#Running_GNOME_programs_outside_of_GNOME>
    # KDE/Plasma: <https://wiki.nixos.org/wiki/KDE#GTK_themes_are_not_applied_in_Wayland_applications>
    # PulseAudio: <https://wiki.nixos.org/wiki/PulseAudio#Paprefs_doesn.27t_work_on_KDE>
    # WM/i3: <https://wiki.nixos.org/wiki/I3#DConf>
    dconf.enable = true;

    virt-manager.enable = true;

    geary.enable = true;

    # <https://wiki.nixos.org/wiki/Appimage>
    appimage = {
      enable = true;
      binfmt = true;
    };

    #- <https://wiki.nixos.org/wiki/Node.js>
    # `npm set prefix ~/.npm-global` to use global packages
    npm = {
      enable = true;
      npmrc = ''
        prefix = ''${HOME}/.npm
        color = true
      '';
    };

    nano = {
      syntaxHighlight = true;
    };

    adb.enable = true;

    # kdeconnect.enable = true;
    htop.enable = true;
    iotop.enable = true;
    iftop.enable = true;
    mtr.enable = true;
    seahorse.enable = true;

    openvpn3.enable = false;

    atop = {
      enable = true;
      atopgpu.enable = true;
    };

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-volman # PLUGIN: Provides automatic management of removable drives and media.
        thunar-archive-plugin # PLUGIN: Provides file context menus for archives.
        thunar-media-tags-plugin # PLUGIN: Provides tagging and renaming features for media files.
        thunar-dropbox-plugin # PLUGIN: Adds context-menu items for Dropbox to Thunar.
        tumbler # PLUGIN: Provides thumbnailing and metadata extraction for various file types.
        catfish # GUI: Handy file search tool.
      ];
    };

    localsend = {
      enable = false;
      openFirewall = true;
    };

    # Required by thunar if xfce is not used as desktop environment
    # preference changes are discarded otherwise
    # <https://wiki.nixos.org/wiki/Thunar#Configuration>
    xfconf.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryPackage = pkgs.pinentry-gnome3;
    };

    # <https://wiki.nixos.org/wiki/Git>
    git = {
      enable = true;
      lfs.enable = true;
    };

    envision = {
      enable = false;
      openFirewall = true;
    };
  };
}
