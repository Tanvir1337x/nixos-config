# Home Manager User's Programs Configuration
_: let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.user = {
    pkgs,
    lib,
    ...
  }: {
    programs = {
      firefox = {
        enable = true;
        package = pkgs.firefox-esr;
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

      thefuck = {
        enable = true;
        enableInstantMode = true; # Experimental as of 20/06/2024

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
        package = pkgs.vscode.fhs; # gui: vscode with fhs-3.0 environment (chroot)
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
          downloader = lib.getExe pkgs.aria2;
          downloader-args = "aria2c:'-c -x8 -s8 -k1M'";
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
          neovim-qt # gui: Neovim client library and GUI, in Qt5
          neovim-gtk # gui: Gtk ui for neovim
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

      # TODO: Setup mangohud
      # mangohud.enable = true;

      gpg.enable = true;
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

      gh = {
        enable = true;
        gitCredentialHelper.enable = true;

        settings = {
          git_protocol = "ssh";
          prompt = "enabled";
          editor = "micro";
        };

        extensions = with pkgs; [
          gh-eco # extension: Explore the ecosystem
          gh-cal # extension: GitHub contributions calender terminal viewer
          gh-dash # extension: Display a dashboard with pull requests and issues
          gh-markdown-preview # extension: Preview Markdown looking like on GitHub
          gh-copilot # extension: GitHub Copilot
          gh-actions-cache # extension: Manage GitHub Actions caches
          gh-screensaver # extension: Animated terminal screensavers
          gh-notify # extension: Display GitHub notifications
          gh-poi # extension: Safely clean up your local branches
          gh-s # extension: Search github repositories interactively
          gh-f # extension: GitHub CLI ultimate FZF extension
          # gh-ost : extension: Triggerless online schema migration solution for MySQL
        ];
      };

      gh-dash.enable = true;

      spotify-player = {
        enable = false;
      };
    };
  };
}
