# Home Manager User's Programs Configuration
_: let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.user = {pkgs, ...}: {
    programs = {
      gpg = {
        enable = true;

        settings = {
          no-comments = false;
        };
      };

      firefox = {
        enable = true;
        package = pkgs.firefox-esr;
      };

      thunderbird = {
        enable = true;
        package = pkgs.thunderbird;

        settings = {
          "privacy.donottrackheader.enabled" = true;
        };

        profiles = {
          "main" = {
            isDefault = true;
            settings = {
              "calendar.alarms.playsound" = false;
              "mail.spellcheck.inline" = false;
            };
          };
        };
      };

      java = {
        enable = true;
        package = pkgs.openjdk;
      };

      librewolf = {
        enable = true;
        # <https://librewolf.net/docs/settings>
        settings = {
          "identity.fxaccounts.enabled" = true;
          "browser.sessionstore.resume_from_crash" = true;
          "privacy.resistFingerprinting.letterboxing" = false;

          "webgl.disabled" = false;

          "middlemouse.paste" = true;
          "general.autoScroll" = true;

          "privacy.clearOnShutdown.history" = false;
          "privacy.clearOnShutdown.downloads" = false;

          "browser.safebrowsing.downloads.enabled" = true;
          "browser.safebrowsing.malware.enabled" = true;
          "browser.safebrowsing.phishing.enabled" = true;
          "browser.safebrowsing.blockedURIs.enabled" = true;
        };
      };

      chromium = {
        enable = true;
        package = pkgs.ungoogled-chromium;
      };

      floorp = {
        enable = true;
        package = pkgs.floorp;
      };

      atuin = {
        enable = true;
        enableFishIntegration = true;
        enableZshIntegration = true;
        enableBashIntegration = true;
        enableNushellIntegration = true;
        package = pkgs.atuin;
      };

      bun = {
        enable = true;
        enableGitIntegration = true;
        package = pkgs.bun;

        # <https://bun.sh/docs/runtime/bunfig>
        settings = {
          logLevel = "debug"; # "debug" | "warn" | "error"
          smol = false; # Reduces memory usage at the cost of performance
          telemetry = false; # Equivalent of DO_NOT_TRACK env variable

          test = {
            coverage = true;
            coverageThreshold = 0.9; # To require 90% line-level and function-level coverage
          };

          install.lockfile = {
            save = true;
            print = "yarn";
          };

          install.cache = {
            # when true, don't load from the global cache.
            # Bun may still write to node_modules/.cache
            disable = false;
            disableManifest = false; # when true, always resolve the latest versions from the registry

            dir = "/home/user/.bun/install/cache";
          };
        };
      };

      broot = {
        enable = true;

        enableBashIntegration = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
        enableNushellIntegration = true;

        settings.modal = false;
      };

      ripgrep = {
        enable = true;
        package = pkgs.ripgrep-all;
        arguments = [
          "--smart-case"
          "--hidden"
          "--max-columns-preview"
          "--colors=line:style:bold"
        ];
      };

      mcfly = {
        enable = true;
        enableLightTheme = false;
        interfaceView = "BOTTOM";
        fuzzySearchFactor = 2;
        fzf.enable = true;
        keyScheme = "vim";

        enableBashIntegration = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
      };

      skim = {
        enable = true;

        enableBashIntegration = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
      };

      tmate = {
        enable = true;
        host = "tmate.io";
        port = 2222;
        # dsaFingerprint =
        # rsaFingerprint =
      };

      tmux = {
        enable = true;
        tmuxinator.enable = true;
        tmuxp.enable = true;
        shell = "${pkgs.fish}/bin/fish";
        terminal = "screen-256color";
        sensibleOnTop = true;
        secureSocket = true; # Store tmux socket under {file}/run, which is more secure
        reverseSplit = false;
        newSession = true;
        mouse = true; # Enable mouse support
        keyMode = "emacs";
        disableConfirmationPrompt = false;
        customPaneNavigationAndResize = false;
        clock24 = false; # Prefer 12-hour clock
        baseIndex = 1; # Start window numbering at 1
        aggressiveResize = true;
        resizeAmount = 10;
        historyLimit = 15000;

        plugins = with pkgs.tmuxPlugins; [
          tmux-thumbs # PLUGIN: Lightning fast version of tmux-fingers written in Rust, copy/pasting tmux like vimium/vimperator.
          tmux-fzf # PLUGIN: Fuzzy finder for tmux.
          tmux-floax # PLUGIN: Floating window support for tmux.
          /*
          tmux-powerline # PLUGIN: Statusbar for tmux that looks like vim-powerline.
          continuum # PLUGIN: Continuous saving of tmux environment.
          {
            plugin = tmuxPlugins.continuum;
            extraConfig = ''
              set -g @continuum-restore 'on'
              set -g @continuum-save-interval '60' # minutes
            '';
          }
          */
        ];
      };

      fzf = {
        enable = true;

        tmux = {
          enableShellIntegration = true;
          shellIntegrationOptions = ["-d 60%"];
        };

        enableBashIntegration = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
      };

      fd = {
        enable = true;
        hidden = true;

        extraOptions = [
          "--no-ignore"
          "--absolute-path"
        ];

        ignores = [
          ".git/"
          "*.bak"
        ];
      };

      aria2 = {
        enable = true;

        settings = {
          seed-ratio = 0;
          continue = true;
          quiet = false;
        };
      };

      thefuck = {
        enable = true;
        enableInstantMode = true; # Experimental as of 20/06/2024

        enableBashIntegration = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
        enableNushellIntegration = true;
      };

      zoxide = {
        enable = true;

        enableBashIntegration = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
        enableNushellIntegration = true;
      };

      eza = {
        enable = true;
        icons = "always";
        git = true;
        enableFishIntegration = true;
        enableZshIntegration = true;
        enableBashIntegration = true;
        enableNushellIntegration = false;
        enableIonIntegration = true;
      };

      bat = {
        enable = true;
        config = {
          theme = "TwoDark";
        };

        extraPackages = with pkgs.bat-extras; [
          batgrep
          batman
          batpipe
          batwatch
          batdiff
          prettybat
        ];
      };

      feh = {
        enable = true;
        package = pkgs.feh;

        themes = {
          booth = [
            "--full-screen"
            "--hide-pointer"
            "--slideshow-delay"
            "20"
          ];

          feh = [
            "--image-bg"
            "black"
          ];

          imagemap = [
            "-rVq"
            "--thumb-width"
            "40"
            "--thumb-height"
            "30"
            "--index-info"
            "%n\\n%wx%h"
          ];

          present = [
            "--full-screen"
            "--sort"
            "name"
            "--hide-pointer"
          ];

          webcam = [
            "--multiwindow"
            "--reload"
            "20"
          ];
        };

        buttons = {
          zoom_in = 4;
          zoom_out = "C-4";
        };

        keybindings = {
          zoom_in = "plus";
          zoom_out = "minus";
        };
      };

      yazi = {
        enable = true;
        enableFishIntegration = true;
        enableZshIntegration = true;
        enableBashIntegration = true;
        enableNushellIntegration = true;
      };

      /*
      dconf.settings = {
        "org/virt-manager/virt-manager/connections" = {
          autoconnect = ["qemu:///system"];
          uris = ["qemu:///system"];
        };
      };
      */

      vscode = {
        enable = true;
        # needed for rust lang server and rust-analyzer extension
        #- <https://wiki.nixos.org/wiki/Visual_Studio_Code#Use_VS_Code_extensions_without_additional_configuration>
        package = pkgs.vscode-fhs; # GUI: vscode with fhs-3.0 environment (chroot).
      };

      kitty = {
        enable = true;
        # Note: `xdg.configFile."kitty/kitty.conf".enable = false;` has been set temporarily in hm settings.nix
        shellIntegration = {
          # https://sw.kovidgoyal.net/kitty/shell-integration
          mode = "no-rc"; # no-rc is always implied
          enableBashIntegration = true;
          enableZshIntegration = true;
          enableFishIntegration = true;
        };
      };

      mpv = {
        enable = true;
        defaultProfiles = ["gpu-hq"];

        scripts = with pkgs.mpvScripts; [
          uosc # SCRIPT: Feature-rich minimalist proximity-based UI.
          evafast # SCRIPT: Seeking and hybrid fastforwarding like VHS.
          # thumbnail # SCRIPT: Lua script to show preview thumbnails in mpv's OSC seekbar.
          # smartskip # SCRIPT: Automatically or manually skip opening, intro, outro, and preview
          thumbfast # SCRIPT: High-performance on-the-fly thumbnailer.
          seekTo # SCRIPT: For seeking to a specific position.
          webtorrent-mpv-hook # SCRIPT: Adds a hook that allows mpv to stream torrents.
          mpv-cheatsheet # SCRIPT: For looking up keyboard shortcuts.
          quality-menu # SCRIPT: Allows you to change youtube video quality (ytdl-format) on the fly.
          reload # SCRIPT: Manual & automatic reloading of videos.
          autoload # SCRIPT: Automatically loads playlist entries before and after the currently played file.
          autocrop # SCRIPT: Uses the lavfi cropdetect filter to automatically insert a crop filter with appropriate parameters for the currently playing video.
          youtube-upnext # SCRIPT: Allows you to play 'up next'/recommended youtube videos.
          youtube-chat # SCRIPT: MPV script to overlay youtube chat on top of a video using yt-dlp.
          sponsorblock # SCRIPT: Skip sponsored segments of YouTube videos.
          # sponsorblock-minimal # SCRIPT: Skip sponsored segments of YouTube videos (minimal version).
          visualizer # SCRIPT: Various audio visualization.
          videoclip # SCRIPT: Easily create videoclips.
          # cutter # SCRIPT: Cut videos and concat them automatically.
          # convert # SCRIPT: Convert parts of a video while you are watching it in mpv
          memo # SCRIPT: Recent files menu.
          # simple-mpv-webui # SCRIPT: Simple Web based user interface with controls.
          mpv-playlistmanager # SCRIPT: Create and manage playlists.
          # modernx-zydezu # SCRIPT: Zydezu fork of modernx - A Modern OSC UI replacement for MPV that retains the functionality of the default OSC.
          # modernx # SCRIPT: Modern OSC UI replacement for MPV that retains the functionality of the default OSC.
          # inhibit-gnome # SCRIPT: Prevents screen blanking in GNOME.
          autosubsync-mpv # SCRIPT: Automatically sync subtitles using the `n` button.
          blacklistExtensions # SCRIPT: Automatically remove playlist entries based on their extension.
          # mpv-discord # SCRIPT: Cross-platform Discord Rich Presence integration for mpv with no external dependencies.
          manga-reader # SCRIPT: Manga reading script for mpv.
          # occivink.crop # SCRIPT: Crop the current video in a visual manner.
          mpv-notify-send # SCRIPT: Lua script for mpv to send notifications with notify-send.
          webtorrent-mpv-hook # SCRIPT: Adds a hook that allows mpv to stream torrents.
          # simple-mpv-webui # SCRIPT: Web based user interface with controls for the mpv mediaplayer.
        ];

        # Values adapted from: <https://github.com/Tsubajashi/mpv-settings/blob/master/mpv_linux.conf>
        config = {
          profile = "gpu-hq";
          hwdec = "auto-copy"; # enable hardware decoding, defaults to 'no'
          vo = "gpu-next";
          keep-open = true;
          fs = false; # Don't start in fullscreen mode by default
          gpu-context = "auto";
          ytdl-format = "bestvideo[height<=1080]+bestaudio/best[height<=1080]"; # 1080p Max
          cache = true;
          force-window = true;

          dither-depth = "auto";

          volume = 100;
          volume-max = 125;
          # audio-stream-silence = true; # fix audio popping on random seek | Breaks certain player behavior
          audio-file-auto = "fuzzy"; # external audio doesn't has to match the file name exactly to autoload
          audio-pitch-correction = true; # automatically insert scaletempo when playing with higher speed

          subs-fallback = "default";
          alang = "en,eng";
          slang = "en,eng";
          vlang = "en,eng";

          screenshot-format = "png";
          screenshot-png-compression = 5; # Range is 0 to 10
          screenshot-tag-colorspace = true;
          screenshot-high-bit-depth = true; # Same output bitdepth as the video
          screenshot-directory = "/home/user/media/pictures/screenshots/";

          hr-seek-framedrop = false;

          deband = true;
          deband-iterations = 4;
          deband-threshold = 35;
          deband-range = 16;
          deband-grain = 4;

          # video-sync = "display-resample";
          # interpolation = true;
          # tscale = "sphinx";

          # SDR
          # tone-mapping = "bt.2446a";

          # HDR
          # target-colorspace-hint = true;

          deinterlace = false; # Global reset of deinterlacing to off

          # osc = false;
          # border = false;
          # msg-color = true;
          # msg-module = false;
        };

        /*
        scriptOpts = {
          thumbfast = {
            hwdec = false;
          };

          osc = {
            scalewindowed = 2.0;
            vidscale = false;
            visibility = "always";
          };
        };
        */
      };

      direnv = {
        enable = true;
        nix-direnv.enable = true;

        enableBashIntegration = true;
        enableZshIntegration = true;
        enableNushellIntegration = true;
        enableFishIntegration = true;
      };

      nushell = {
        enable = true;
      };

      starship = {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
        enableNushellIntegration = true;
        enableIonIntegration = true;

        settings = {
          "$schema" = "https://starship.rs/config-schema.json";

          add_newline = true;
          scan_timeout = 10;

          character = {
            success_symbol = "[:](bold #CB8B8B)[:](bold #6AFF7F)";
            error_symbol = "[:](bold #CB8B8B)[:](bold #DF2929)";
            vimcmd_symbol = "[:](bold #CB8B8B)[:](bold #F46B32)";
            vimcmd_replace_one_symbol = "[:](bold #CB8B8B)[:](bold #C80853)";
            vimcmd_replace_symbol = "[:](bold #CB8B8B)[:](bold #823ADB)";
            vimcmd_visual_symbol = "[:](bold #CB8B8B)[:](bold #4FADB5)";
          };

          directory = {
            style = "bold #D77ABC";
            truncation_length = 5;
            truncate_to_repo = true;
          };

          cmd_duration = {
            format = " took [~$duration]($style) ";
            style = "bold #BC5237";
            show_notifications = true;
          };

          package = {
            disabled = false;
          };
        };
      };

      yt-dlp = {
        enable = true;
        package = pkgs.yt-dlp;

        # <https://github.com/yt-dlp/yt-dlp?tab=readme-ov-file#configuration>
        settings = {
          output = "~/downloads/yt-dlp/%(title)s.%(ext)s";
          format = ''"bestvideo[height<=1080]+bestaudio/best[height<=1080]"''; # 1080p Max
          audio-format = "best";
          embed-thumbnail = true;
          embed-subs = true;
          sub-langs = "en.\\*";
          windows-filenames = true;
          # write-auto-sub = true;
          write-sub = true;
          embed-chapters = true;
          embed-info-json = true;
          embed-metadata = true;
          compat-options = "no-certifi";
          # downloader = lib.getExe pkgs.aria2;
          # downloader-args = "aria2c:'-c -x8 -s8 -k1M'";
          # sponsorblock-mark = "all";
        };

        # <https://github.com/yt-dlp/yt-dlp?tab=readme-ov-file#usage-and-options>
        extraConfig = ''
          --no-quiet
          --continue
          --progress
          --console-title
          --no-abort-on-error
          --yes-playlist
          --xattrs
        '';
      };

      gallery-dl = {
        enable = true;
        package = pkgs.gallery-dl;
        # <https://github.com/mikf/gallery-dl?tab=readme-ov-file#configuration>
        settings = {
          extractor.base-directory = "~/downloads/gallery-dl";
          extractor.skip = true;
          extractor.ytdl.enabled = true; # Use yt-dlp as a fallback
          extractor.ytdl.format = "bestvideo[height<=1080]+bestaudio/best[height<=1080]"; # 1080p Max
          downloader.enabled = true;
          downloader.progress = 0;
        };
      };

      cava = {
        enable = true;

        settings = {
          general = {
            framerate = 100;
            bar_width = 1;
            bar_spacing = 1;
          };

          smoothing = {
            integral = 100;
            monstercat = 1;
            waves = 0;
            gravity = 300;
          };

          color = {
            gradient = 1;
            gradient_count = 4;
            gradient_color_1 = "'#8DB8CD'";
            gradient_color_2 = "'#73B4D3'";
            gradient_color_3 = "'#C38F8F'";
            gradient_color_4 = "'#CA8085'";
          };

          input = {
            source = "auto";
          };

          output = {
            method = "ncurses";
            data_format = "ascii";
            bit_format = "16bit";
          };
        };
      };

      emacs = {
        enable = true;
        package = pkgs.emacs-gtk;
        extraPackages = epkgs: [
          epkgs.magit
          epkgs.zoxide
        ];
      };

      vim = {
        enable = true;
        packageConfigurable = pkgs.vim-full;
      };

      neovim = {
        enable = true;
        package = pkgs.neovim-unwrapped;
        withNodeJs = true;
        withPython3 = true;
        coc.enable = false;

        /*
        extraPackages = with pkgs; [
          neovim-qt # GUI: Neovim client library and GUI, in Qt5
          neovim-gtk # GUI: Gtk ui for neovim
        ];
        */
      };

      /*
      As of 19/11/2024
      It requires package ‘cctools-1010.6’ to build which is not available on the x86_64-unknown-linux-gnu
      */
      neovide = {
        enable = true;
        package = pkgs.neovide;
        settings = {
          vsync = true;
        };
      };

      helix = {
        enable = true;
        package = pkgs.evil-helix;
        ignores = ["!.gitignore"];

        languages = {
          language-server = {
            nixd = {
              command = "nixd";
            };
          };
        };

        settings = {
          theme = "everforest_dark";
        };
      };

      micro = {
        enable = true;
        package = pkgs.micro-full;
        settings = {
          # <https://github.com/zyedidia/micro/blob/master/runtime/help/colors.md>
          colorscheme = "atom-dark";
          mouse = true;
          syntax = true;
          autoclose = true; # Automatically closes brackets, quotes, etc
          comment = true; # Provides automatic commenting for a number of languages
          linter = true; # Provides linting support for a number of languages
          hlsearch = true;
          cursorline = true;
          autoindent = true;
          autosu = false;
          # Backups are stored in ~/.config/micro/backups (removed when the buffer is closed cleanly)
          backup = true; # Automatically keep backups of all open buffers
          autosave = 6; # Warn: Saves the buffer without prompting the user, so data may be overwritten
          # Information is saved to ~/.config/micro/buffers/history
          savehistory = true; # Save the history of commands (between closing and re-opening micro)
          # Information is saved to ~/.config/micro/buffers/
          saveundo = true; # Save the undo history (even after closing a file)
        };
      };

      kakoune = {
        enable = true;

        config = {
          colorScheme = "gruvbox-dark";
          incrementalSearch = true;

          autoReload = "ask";

          numberLines = {
            enable = true;
            highlightCursor = true;
            relative = true;
          };

          scrollOff = {
            lines = 5;
            columns = 10;
          };

          showMatching = true;

          showWhitespace = {
            enable = true;
            lineFeed = "¬";
            nonBreakingSpace = "⍽";
            space = " ";
            tab = "→";
            tabStop = " ";
          };

          tabStop = 4;
          indentWidth = 4;

          ui = {
            enableMouse = true;
            assistant = "cat";
            changeColors = true;
            statusLine = "bottom";
          };

          hooks = [
            {
              group = "smarttab";
              name = "InsertChar";
              option = ''"\t"'';
              commands = ''
                try %{
                  execute-keys -draft "h<a-h><a-k>\A\h+\z<ret><a-;>;%opt{indentwidth}@"
                }'';
            }
            {
              group = "smarttab";
              name = "InsertDelete";
              option = "' '";
              commands = ''
                try %{
                  execute-keys -draft 'h<a-h><a-k>\A\h+\z<ret>i<space><esc><lt>'
                }'';
            }
            {
              group = "lsp";
              name = "WinSetOption";
              option = "filetype=(rust|go|c|cpp|nix)";
              commands = ''
                lsp-enable-window
                lsp-inlay-diagnostics-enable global'';
            }
            {
              group = "lsp";
              name = "WinSetOption";
              option = "filetype=(rust|go|c|cpp)";
              commands = "hook window BufWritePre .* lsp-formatting-sync";
            }
            {
              group = "rust";
              name = "WinSetOption";
              option = "filetype=rust";
              commands = ''
                set-option -add global lsp_server_configuration rust.clippy_preference="on"
                hook window -group rust BufReload .* rust-analyzer-inlay-hints
                hook window -group rust NormalIdle .* rust-analyzer-inlay-hints
                hook window -group rust InsertIdle .* rust-analyzer-inlay-hints
                hook -once -always window WinSetOption filetype=.* %{
                  remove-hooks window rust-inlay-hints
                }'';
            }
          ];

          keyMappings = [
            {
              mode = "normal";
              key = "K";
              effect = ":lsp-hover<ret>";
              docstring = "Show hover";
            }
          ];
        };

        plugins = with pkgs.kakounePlugins; [kakoune-lsp kak-fzf auto-pairs-kak];
      };

      mangohud = {
        enable = true;
        enableSessionWide = true;

        # Using GOverlay to configure MangoHud
        /*
        settings = {
          output_folder = "/home/user/mangohud/";
          full = true;
          fps-limit = 0; # 0 means unlimited unless VSynced
        };
        */

        settingsPerApplication = {
          mpv = {
            no_display = true;
          };
        };
      };

      obs-studio = {
        enable = true;
        plugins = with pkgs.obs-studio-plugins; [
          waveform # PLUGIN: Audio spectral analysis plugin for OBS.
          obs-vkcapture # PLUGIN: OBS Linux Vulkan/OpenGL game capture.
          obs-vintage-filter # PLUGIN: OBS Studio filter where the source can be set to be black & white or sepia.
          obs-webkitgtk # PLUGIN: Yet another OBS Studio browser source.
          obs-vertical-canvas # PLUGIN: Plugin for OBS Studio to add vertical canvas.
          obs-vaapi # PLUGIN: OBS Studio VAAPI support via GStreamer.
          obs-tuna # PLUGIN: Song information plugin for obs-studio.
          # obs-transition-table # PLUGIN: Plugin for OBS Studio to add a Transition Table to the tools menu.
          obs-text-pthread # PLUGIN: Rich text source plugin for OBS Studio.
          obs-teleport # PLUGIN: OBS Studio plugin for an open NDI-like replacement.
          obs-source-switcher # PLUGIN: Plugin for OBS Studio to switch between a list of sources.
          obs-source-record # PLUGIN: OBS Studio plugin to make sources available to record via a filter.
          obs-source-clone # PLUGIN: Plugin for OBS Studio to clone sources.
          obs-shaderfilter # PLUGIN: OBS Studio filter for applying an arbitrary shader to a source.
          obs-scale-to-sound # PLUGIN: OBS filter plugin that scales a source reactively to sound levels.
          obs-rgb-levels-filter # PLUGIN: Simple OBS Studio filter to adjust RGB levels.
          obs-replay-source # PLUGIN: Replay source for OBS studio.
          obs-pipewire-audio-capture # PLUGIN: Audio device and application capture for OBS Studio using PipeWire.
          obs-nvfbc # PLUGIN: OBS Studio source plugin for NVIDIA FBC API.
          obs-ndi # PLUGIN: Network A/V plugin for OBS Studio.
          obs-mute-filter # PLUGIN: OBS Studio plugin to mute audio of a source
          obs-multi-rtmp # PLUGIN: Multi-site simultaneous broadcast plugin for OBS Studio.
          obs-move-transition # PLUGIN: Plugin for OBS Studio to move source to a new position during scene transition.
          obs-livesplit-one # PLUGIN: OBS Studio plugin for adding LiveSplit One as a source.
          # obs-hyperion # PLUGIN: OBS Studio plugin to connect to a Hyperion.ng server.
          obs-gstreamer # PLUGIN: OBS Studio source, encoder and video filter plugin to use GStreamer elements/pipelines in OBS Studio.
          obs-gradient-source # PLUGIN: Plugin for adding a gradient Source to OBS Studio.
          obs-freeze-filter # PLUGIN: Plugin for OBS Studio to freeze a source using a filter.
          obs-composite-blur # PLUGIN: Comprehensive blur plugin for OBS that provides several different blur algorithms, and proper compositing.
          obs-command-source # PLUGIN: OBS Studio plugin that provides a dummy source to execute arbitrary commands when a scene is switched.
          obs-backgroundremoval # PLUGIN: OBS plugin to replace the background in portrait images and video.
          obs-3d-effect # PLUGIN: Plugin for OBS Studio adding 3D effect filter.
          looking-glass-obs # PLUGIN: Plugin for OBS Studio for efficient capturing of looking-glass.
          input-overlay # PLUGIN: Show keyboard, gamepad and mouse input on stream.
          # droidcam-obs # PLUGIN: OBS Studio plugin for DroidCam.
          advanced-scene-switcher # PLUGIN: Automated scene switcher for OBS Studio.
        ];
      };

      freetube = {
        enable = true;

        settings = {
          allowDashAv1Formats = true;
          checkForUpdates = false;
          defaultQuality = "1080";
          baseTheme = "catppuccinMocha";
        };
      };

      lazygit.enable = true;
      gitui.enable = true;

      git = {
        enable = true;
        package = pkgs.gitFull;
        lfs.enable = true;
        delta.enable = true;

        userEmail = "tanvir.ahmed.tonoy@proton.me";
        userName = "Tanvir";

        signing = {
          signByDefault = true;
          key = "/home/user/.ssh/id_ed25519.pub";
        };

        diff-so-fancy = {
          enable = false;
          changeHunkIndicators = true;
          markEmptyLines = true;
          stripLeadingSymbols = true;
          useUnicodeRuler = true;
        };

        difftastic = {
          enable = false;
          background = "dark";
          color = "auto";
        };
      };

      jq = {
        enable = true;
        # colors
      };

      gh = {
        enable = true;
        gitCredentialHelper.enable = true;

        settings = {
          git_protocol = "ssh";
          prompt = "enabled";
          editor = "micro";
        };

        extensions = with pkgs; [
          gh-eco # EXTENSION: Explore the ecosystem.
          gh-cal # EXTENSION: GitHub contributions calender terminal viewer.
          gh-dash # EXTENSION: Display a dashboard with pull requests and issues.
          gh-markdown-preview # EXTENSION: Preview Markdown looking like on GitHub.
          gh-copilot # EXTENSION: GitHub Copilot.
          gh-actions-cache # EXTENSION: Manage GitHub Actions caches.
          gh-screensaver # EXTENSION: Animated terminal screensavers.
          gh-notify # EXTENSION: Display GitHub notifications.
          gh-poi # EXTENSION: Safely clean up your local branches.
          gh-s # EXTENSION: Search github repositories interactively.
          gh-f # EXTENSION: GitHub CLI ultimate FZF extension.
          # gh-ost : EXTENSION: Triggerless online schema migration solution for MySQL.
        ];
      };

      gh-dash.enable = true;

      spotify-player = {
        enable = false;
      };
    };
  };
}
