# Home Manager User's Packages Configuration
_: let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
  #- App Data Locations
  /*
  Data: /var/lib/<pkg>/
  NixOS Applications (.desktops): /run/current-system/sw/share/applications/
  Home-manager Applications (.desktops): ~/.local/state/home-manager/gcroots/current-home/home-path/share/applications/
  */
  /*
  nix-software-center = import (pkgs.fetchFromGitHub {
    owner = "snowfallorg";
    repo = "nix-software-center";
    rev = "216eb549f1ec222c2877d2194f2987527954f2c4";
    sha256 = "sha256-hq3jlW5lyT2RkWhJ2/Oo+dt9FXtJ47zDDBBk8A8abMo=";
  }) {};

  nixos-conf-editor = import (pkgs.fetchFromGitHub {
    owner = "snowfallorg";
    repo = "nixos-conf-editor";
    rev = "27b5e92f580f794c690093503869aab242f075ab";
    sha256 = "sha256-UtLeZzDdk96sLTRcWsGrkWCslNUDytrGe0VmOTB/iig=";
  }) {};

  nix-editor = import (pkgs.fetchFromGitHub {
    owner = "snowfallorg";
    repo = "nix-editor";
    rev = "b5017f8d61753ce6a3a1a2aa7e474d59146a8ae3";
    sha256 = "sha256-Ne9NG7x45a8aJyAN+yYWbr/6mQHBVVkwZZ72EZHHRqw=";
  }) {};
  */
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.user = {pkgs, ...}: {
    home.packages = with pkgs; [
      # Code editors
      code-cursor # GUI: AI-powered code editor built on vscode
      pulsar # GUI: Community-led Hyper-Hackable Text Editor
      pragtical # GUI: Practical and pragmatic code editor.
      vscodium-fhs # GUI: VSCode without MS branding/telemetry/licensing; Wrapped variant of vscodium which launches in a FHS compatible environment. Should allow for easy usage of extensions without nix-specific modifications.
      lite-xl # GUI: Lightweight text editor written in Lua.
      mate.pluma # GUI: Powerful text editor for the MATE desktop environment.
      xed-editor # GUI: Light weight text editor from Linux Mint.
      kibi # CLI: Text editor in ≤1024 lines of code, written in Rust.
      zed-editor # GUI: High-performance, collaborative code editor from the creators of Atom and Tree-sitter.
      ox # CLI: Independent Rust-based text editor.
      lapce # GUI: Lightning-fast and powerful code editor written in Rust.
      amp # CLI: Modern text editor inspired by Vim.
      xfce.mousepad # GUI: Simple text editor for Xfce.
      mle # CLI: Small, flexible, terminal-based text editor.
      your-editor # CLI: Your-editor (yed) is a small and simple terminal editor core that is meant to be extended through a powerful plugin architecture.
      /*
      kakoune # CLI: Vim inspired text editor.
      helix # CLI: Post-modern text editor.
      evil-helix # CLI: Post-modern modal text editor, with vim keybindings.
      neovide # GUI: Neovim GUI with enhanced features like animations and ligatures.
      emacs # CLI: The extensible, customizable GNU text editor.
      vim # CLI: The most popular clone of the VI editor.
      neovim # CLI: A Vim fork focused on extensibility and agility.
      micro # CLI: Modern and intuitive terminal-based text editor.
      nano # CLI: Small, user-friendly console text editor.
      */
      # End of Code editors

      # AI/Machine Learning
      /*
      nur.repos.some-pkgs.llama-cpp # CLI: Port of Facebook's LLaMA model in C/C++ (master branch).
      llama-cpp # CLI: Port of Facebook's LLaMA model in C/C++.
      */
      # End of AI/Machine Learning

      # Development Tools
      # TODO: Setup Declarative and reproducible Jupyter environments - <https://github.com/tweag/jupyenv>
      shellcheck # CLI: Static analysis tool for shell scripts.
      shfmt # CLI: Shell script formatter.
      shc # CLI: Shell script compiler.
      wakatime # CLI: Tracks time spent on projects.
      gitkraken # GUI: Popular Git client with a user-friendly interface.
      act # CLI: Run your GitHub Actions locally.
      just # CLI: Saves and runs project-specific commands.
      github-desktop # GUI: GUI for managing Git repositories and interacting with GitHub.
      meld # GUI: Visual diff and merge tool.
      kdePackages.kompare # GUI: Diff/patch frontend for KDE.
      diffuse # GUI: Graphical tool for merging and comparing text files.
      code2prompt # CLI: Converts codebases into LLM prompts with source tree, templating, and token counting.
      processing # GUI: Language and IDE for electronic arts and visual programming.
      /*
      serie # CLI: Displays a rich Git commit graph in your terminal.
      github-copilot-cli # CLI: Command-line interface for GitHub Copilot.
      shellharden # CLI: Corrective bash syntax highlighter.
      sqlite # CLI: Self-contained, serverless, zero-configuration SQL database engine.
      sqliteman # GUI: Simple but powerful SQLite GUI database manager.
      polypane # GUI: Browser with unified devtools focused on responsiveness and accessibility.
      spyder # GUI: Scientific Python development environment.
      racket # GUI: General-purpose multi-paradigm programming language with Dr. Racket IDE.
      linkchecker # CLI: Checks websites for broken links.
      git-cola # GUI: Sleek and powerful Git GUI.
      gitg # GUI: GNOME GUI client to view Git repositories.
      gitoxide # CLI: Command-line application for interacting with Git repositories.
      mercurialFull # CLI: Fast, lightweight SCM system for large distributed projects (full version).
      sqlite-web # WEB: Web-based SQLite database browser.
      sqlitebrowser # GUI: DB Browser for SQLite.
      */
      # End of Development Tools

      # Android
      gnirehtet # CLI: Reverse tethering over adb for Android.
      scrcpy # CLI: Display and control Android devices over USB or TCP/IP.
      qtscrcpy # GUI: Qt-based GUI for scrcpy.
      android-file-transfer # GUI: Reliable MTP client with minimalistic UI.
      trueseeing # CLI: Non-decompiling Android vulnerability scanner.
      /*
      agi # GUI: Android GPU Inspector by Google.
      aemu # UTIL: Android emulation utilities library.
      android-studio-full # GUI: Official IDE for Android development (Stable channel).
      androidStudioPackages.dev # GUI: Android Studio development packages (Dev channel).
      androidStudioPackages.canary # GUI: Android Studio development packages (Canary channel).
      androidStudioPackages.beta # GUI: Android Studio development packages (Beta channel).
      android-studio-tools # CLI: Command-line tools for Android Studio.
      android-studio-for-platform # GUI: The Official IDE for Android platform development.
      universal-android-debloater # GUI: Tool to debloat non-rooted Android devices.
      apktool # CLI: Tool for reverse engineering Android apk files.
      androguard # CLI/LIB: Reverse engineering and pentesting for Android applications.
      apksigner # CLI: Command line tool to sign and verify Android APKs.
      ghost # CLI: An Android post-exploitation framework that exploits the Android Debug Bridge to remotely access an Android device.
      anbox # GUI: Android in a box.
      genymotion # GUI: Fast and easy Android emulation.
      waydroid # GUI: Container-based approach to boot a full Android system on a regular GNU/Linux system.
      */
      # End of Android

      # Cloud Storage Clients
      /*
      megasync # Tray: MEGA Cloud Drive client.
      onedrivegui # GUI: OneDrive client with multi-account support.
      maestral-gui # GUI: GUI for Maestral, an open-source Dropbox client.
      cozy-drive # GUI: Cozy Cloud synchronization tool.
      */
      # End of Cloud Storage Clients

      # TeX/LaTeX
      /*
      lyx # GUI: WYSIWYM frontend for LaTeX and DocBook.
      */
      # End of TeX/LaTeX

      # Python Development
      /*
      python3Full # CLI: Python 3 interpreter (full version).
      spyder # GUI: The Scientific Python Development Environment.
      */
      # End of Python Development

      # Kubernetes
      /*
      kubernetes-helm # CLI: Package manager for Kubernetes.
      */
      # End of Kubernetes

      # JavaScript Development
      #- <https://wiki.nixos.org/wiki/Node.js>
      yarn # CLI: Fast, reliable, and secure dependency management for JavaScript.
      nodenv # CLI: Manage multiple Node.js versions.
      node2nix # CLI: Generate Nix expressions to build NPM packages.
      yarn2nix # CLI: Convert packages.json and yarn.lock into a Nix expression.
      npkill # CLI: Easily find and remove old and heavy node_modules folders.
      deno # CLI: Secure runtime for JavaScript and TypeScript.
      /*
      nodejs # CLI: Event-driven I/O framework for the V8 JavaScript engine.
      nodePackages.npm # CLI: Package manager for JavaScript.
      */
      # End of JavaScript Development

      # Perl Development
      perl # CLI: Standard implementation of the Perl 5 programming language.
      # End of Perl Development

      # File Sharing
      /*
      localsend # GUI: Open source cross-platform alternative to AirDrop.
      kdePackages.kdeconnect-kde # GUI: KDE Connect integrates phone and computer.
      */
      # End of File Sharing

      # Shells
      /*
      nushellFull # CLI: Modern shell written in Rust.
      */
      #- Shell Plugins
      #-- Fish Shell
      /*
      oh-my-fish # CLI: Framework for the Fish shell.
      */
      # End of Shell Plugins
      # End of Shells

      # Encryption
      picocrypt # GUI: Very small, very simple, yet very secure encryption tool, written in Go.
      picocrypt-cli # CLI: Command-line interface for Picocrypt.
      git-crypt # CLI: Transparent file encryption in git.
      kdePackages.kgpg # GUI: Simple interface for GnuPG, a powerful encryption utility.
      gnome-obfuscate # GUI: Censors private information in images.
      /*
      seahorse # GUI: Application for managing encryption keys and passwords in the GnomeKeyring.
      veracrypt # GUI: On-the-fly encryption software.
      */
      # End of Encryption

      # OSINT
      octosuite # CLI: Advanced Github OSINT framework.
      sherlock # CLI: Hunt down social media accounts by username across social networks.
      # End of OSINT

      # Command-Line Utilities
      see # CLI: Cute cat(1) for the terminal.
      moar # CLI: Nice-to-use pager for humans.
      youtube-tui # TUI: Aesthetically pleasing YouTube TUI written in Rust.
      argc # CLI: Command-line options, arguments, and sub-commands parser for Bash.
      grc # CLI: Generic text colorizer.
      cod # Daemon: Generates Bash/Fish/Zsh autocompletions based on `--help` output.
      trashy # CLI: Alternative to 'rm' and 'trash-cli'.
      rip2 # CLI: Safe and ergonomic alternative to rm.
      scooter # CLI: Interactive find and replace in the terminal.
      radio-cli # CLI: Simple radio CLI written in rust.
      gtop # CLI: System monitoring dashboard for the terminal.
      duf # CLI: Disk Usage/Free Utility.
      progress # CLI: Shows the progress of coreutils programs.
      gping # CLI: Ping with a graphical representation.
      yq # CLI: Command-line YAML/XML/TOML processor.
      cointop # CLI: Terminal-based UI for tracking cryptocurrencies.
      terminal-stocks # CLI: Terminal based application that provides stock price information.
      glow # CLI: Renders Markdown on the CLI with styling.
      kmon # CLI: Linux Kernel Manager and Activity Monitor.
      dropwatch # CLI: Linux kernel dropped packet monitor.
      kernel-hardening-checker # CLI: Tool for checking the security hardening options of the Linux kernel.
      systemctl-tui # TUI: Simple TUI for interacting with systemd services and their logs.
      imgcat # CLI: Displays images in the terminal.
      procs # CLI: Modern replacement for 'ps' written in Rust.
      tokei # CLI: Counts lines of code.
      runiq # CLI: Filters duplicate lines from input.
      choose # CLI: Human-friendly alternative to 'cut' and 'awk'.
      watchexec # CLI: Executes commands in response to file modifications.
      bandwhich # CLI: Displays current network utilization.
      grex # CLI: Generates regular expressions from test cases.
      eva # CLI: Calculator REPL, similar to 'bc'.
      discordchatexporter-cli # CLI: Tool to export Discord chat logs to a file.
      /*
      out-of-tree # CLI: kernel {module, exploit} development tool.
      rm-improved # CLI: Safer and more ergonomic replacement for 'rm'.
      zoxide # CLI: Fast 'cd' command that learns your habits.
      broot # CLI: Interactive tree view, fuzzy search, and customizable commands.
      skim # CLI: Command-line fuzzy finder written in Rust.
      bat # CLI: Cat clone with syntax highlighting and Git integration.
      ripgrep # CLI: Fast and powerful search tool.
      mcfly # CLI: Enhanced Ctrl-R for smarter history search.
      exa # CLI: Modern replacement for 'ls' written in Rust.
      eza # CLI: Modern, maintained replacement for 'ls'.
      navi # CLI: Interactive cheatsheet tool for the command-line.
      atuin # CLI: Shell history replacement with context recording and optional sync.
      tealdeer # CLI: Very fast implementation of tldr in Rust.
      fzf # CLI: Command-line fuzzy finder written in Go.
      cheat # CLI: Create and view interactive cheatsheets.
      noti # CLI: Monitors a process and triggers a notification.
      du-dust # CLI: Disk usage analyzer like 'du' but more intuitive.
      duf # CLI: Disk Usage/Free Utility.
      sd # CLI: Intuitive find & replace CLI (sed alternative).
      ouch # CLI: Compresses and decompresses files and directories.
      fclones # CLI: Efficient duplicate file finder and remover.
      ruplacer # CLI: Find and replace text in source files.
      ddgr # CLI: DuckDuckGo search from the terminal.
      xplr # CLI: Hackable, minimal, fast TUI file explorer.
      fd # CLI: Simple, fast, and user-friendly alternative to 'find'.
      ripgrep-all # CLI: Ripgrep with support for various file formats.
      */
      # End of Command-Line Utilities

      # Scanners
      #- Secret scanners
      trufflehog # CLI: Finds and verifies secrets in code and files.
      gitleaks # CLI: Scans Git repositories for secrets.
      ripsecrets # CLI: Command-line tool to prevent committing secret keys into your source code.
      # End of Secret scanners
      #- Vulnerability scanners
      vulnix # CLI: NixOS vulnerability scanner.
      grype # CLI: Vulnerability scanner for container images and filesystems.
      # End of vulnerability scanners
      # End of Scanners

      # Fun/Novelty Tools
      cmatrix # CLI: Simulates The Matrix "falling code" effect.
      neo # CLI: Simulates the digital rain from "The Matrix".
      figlet # CLI: Creates large letters from text.
      toilet # CLI: Display large colourful characters in text mode.
      lolcat # CLI: Rainbow-colored 'cat'.
      dotacat # CLI: Like lolcat, but fast.
      gay # CLI: Colors text with rainbow colors.
      blahaj # CLI: Gay sharks at your local terminal.
      cowsay # CLI: Generates ASCII pictures of a cow with a message.
      ponysay # CLI: Cowsay reimplementation with ponies.
      kittysay # CLI: Cowsay, but with a cute kitty.
      charasay # CLI: Future of cowsay - Colorful characters saying something.
      pokemonsay # CLI: Prints Pokémon in the CLI.
      cbonsai # CLI: Grows bonsai trees in your terminal.
      genact # CLI: Nonsense activity generator.
      nyancat # CLI: Nyancat in your terminal, rendered through ANSI escape sequences.
      terminal-parrot # CLI: Shows colorful, animated party parrot in your terminial.
      doge # CLI: Wow very terminal doge.
      fortune # CLI: Program that displays a pseudorandom message from a database of quotations.
      banner # CLI: Print large banners to ASCII terminals.
      pipes # CLI: Animated pipes terminal screensaver.
      hollywood # CLI: Fill your console with Hollywood melodrama technobabble.
      nms # CLI: A command line tool that recreates the famous data decryption effect seen in the 1992 movie Sneakers.
      asciiquarium-transparent # CLI: Aquarium/sea animation in ASCII art (with option of transparent background).
      xkcdpass # CLI: Generate secure multiword passwords/passphrases, inspired by XKCD.
      fireplace # CLI: Cozy fireplace in your terminal.
      krabby # CLI: Print pokemon sprites in your terminal.
      lavat # CLI: Lava lamp simulation in the terminal.
      /*
      fortune-kind # CLI: Kinder, curated fortune, written in rust.
      asciiquarium # CLI: Enjoy the mysteries of the sea from the safety of your own terminal.
      */
      # End of Fun/Novelty Tools

      # Nix Tools
      comma # CLI: Runs programs without installing them.
      nixd # Daemon: Nix language server.
      alejandra # CLI: Nix code formatter.
      statix # CLI: Linter and code suggestion tool for Nix.
      deadnix # CLI: Finds and removes unused code in Nix files.
      appimage-run # CLI: Runs AppImages on NixOS.
      steam-run # CLI: Runs commands in the Steam FHS environment.
      /*
      nix-web # WEB: Web interface for the Nix store.
      nixfmt # CLI: Nix code formatter.
      # <https://github.com/NixOS/nixpkgs/issues/232640>
      niv # CLI: Dependency manager for Nix projects.
      nixpkgs-review # CLI: Reviews pull requests on the Nixpkgs repository.
      nix-prefetch # CLI: Prefetches package sources.
      nix-prefetch-github # CLI: Prefetches sources from GitHub.
      nix-universal-prefetch # CLI: Uses Nixpkgs fetchers to determine hashes.
      nix-index # CLI: Files database for Nixpkgs.
      */
      # End of Nix Tools

      # Documentation Browsers
      /*
      zeal # GUI: Offline API documentation browser.
      devdocs-desktop # GUI: Desktop app for DevDocs.io.
      devhelp # GUI: API documentation browser for GNOME.
      */
      # End of Documentation Browsers

      # Web Browsers
      tor-browser # GUI: Privacy-focused browser using the Tor network.
      brave # GUI: Privacy-oriented browser.
      mullvad-browser # GUI: Privacy-focused browser from The Tor Project and Mullvad.
      vivaldi # GUI: Browser for our Friends, powerful and personal.
      opera # GUI: Faster, safer and smarter web browser.
      wavebox # GUI: Wavebox Productivity Browser.
      microsoft-edge # GUI: Web browser from Microsoft.
      /*
      arc-browser # GUI: Arc from The Browser Company.
      librewolf # GUI: Firefox fork focused on privacy, security, and freedom.
      yandex-browser # GUI: Yandex Web Browser.
      yandex-browser-beta  # GUI: Yandex Web Browser (Beta Version).
      floorp # GUI: Firefox fork focused on the open web.
      ungoogled-chromium # GUI: Chromium without Google services dependencies.
      chromium # GUI: Open-source web browser from Google.
      */
      # End of Web Browsers

      # P2P File Sharing
      #- Music
      nicotine-plus # GUI: Modern and maintained graphical client for the SoulSeek peer-to-peer system.
      # End of P2P File Sharing

      # Email Clients
      electron-mail # GUI: Electron-based ProtonMail client.
      tutanota-desktop # GUI: Electron-based Tutanota client.
      claws-mail # GUI: User-friendly, lightweight email client.
      /*
      thunderbird # GUI: Full-featured email client from Mozilla.
      geary # GUI: Email client for GNOME 3.
      betterbird # GUI: Enhanced version of Mozilla Thunderbird (Removed as there were insufficient maintainer resources to keep up with security updates).
      */
      # End of Email Clients

      # Reverse Engineering Tools
      ghidra # GUI: Software reverse engineering suite from NSA.
      radare2 # CLI: Reverse engineering framework and command-line tools.
      iaito # GUI: Graphical interface for Radare2.
      cutter # GUI: Free and open-source reverse engineering platform.
      imhex # GUI: Hex editor for reverse engineers and programmers.
      rizin # CLI: Reverse engineering framework and command-line tools.
      apktool # CLI: Tool for reverse engineering Android apk files
      androguard # CLI/LIB: Reverse engineering and pentesting for Android applications
      # End of Reverse Engineering Tools

      # Password Cracking
      cook-framework # CLI: An overpowered wordlist manager.
      hashcat # CLI: Advanced password recovery utility.
      hashcat-utils # CLI: Utilities for hashcat.
      john # CLI: John the Ripper password cracker.
      johnny # CLI: GUI for John the Ripper.
      # End of Password Cracking

      # Networking Tools
      airgorah # GUI: GUI for Aircrack-ng; WiFi security auditing software mainly based on aircrack-ng tools suite.
      aircrack-ng # CLI: WiFi security auditing tools suite.
      whois # CLI: Intelligent WHOIS client from Debian.
      nikto # CLI: Web server scanner.
      fping # CLI: Send ICMP echo probes to network hosts.
      nettools # CLI: Set of tools for controlling the network subsystem in Linux.
      netdiscover # CLI: Network address discovering tool, developed mainly for those wireless networks without dhcp server, it also works on hub/switched networks.
      nethogs # CLI: Small 'net top' tool, grouping bandwidth by process.
      iptraf-ng # CLI: Console-based network monitoring utility (fork of iptraf).
      bmon # CLI: Network bandwidth monitor.
      tshark # CLI: Powerful network protocol analyzer. WireShark CLI.
      termshark # TUI: Terminal UI for wireshark-cli, inspired by Wireshark.
      nmap # CLI: Free and open source utility for network discovery and security auditing.
      httrack # CLI: Offline browser and website mirroring utility.
      katana # CLI: Next-generation crawling and spidering framework.
      dnsrecon # CLI: DNS enumeration script.
      dig # CLI: DNS lookup utility.
      /*
      sniffnet # GUI: Cross-platform network traffic monitor.
      wireshark # GUI: Powerful network protocol analyzer.
      traceroute # CLI: Tracks the route taken by packets over an IP network.
      */
      # End of Networking Tools

      # Data Recovery
      testdisk-qt # GUI: QT GUI for TestDisk.
      /*
      testdisk # CLI: Data recovery utilities.
      */
      # End of Data Recovery

      # Debuggers
      strace # CLI: System call tracer.
      valgrind # CLI: Debugging and profiling tool suite.
      # End of Debuggers

      # CAD Software
      freecad # GUI: Open-source 3D CAD/MCAD/CAx/CAE/PLM modeler.
      openscad-unstable # GUI: Unstable version of OpenSCAD.
      design # GUI: 2D CAD For GNOME.
      qcad # GUI: 2D CAD package based on Qt.
      librecad # GUI: 2D CAD package based on Qt.
      solvespace # GUI: Parametric 3d CAD program.
      leocad # GUI: CAD program for creating virtual LEGO models.
      maskromtool # GUI: CAD tool for extracting bits from Mask ROM photographs.
      /*
      brlcad # GUI: BRL-CAD is a powerful cross-platform open source combinatorial solid modeling system.
      openscad # GUI: 3D parametric model compiler.
      */
      # End of CAD Software

      # 3D Modeling and Animation
      blender # GUI: 3D creation/animation/publishing system.
      /*
      blender-hip # GUI: Blender with HIP support for AMD GPUs.
      */
      # End of 3D Modeling and Animation

      # Sandboxing Tools
      bubblewrap # CLI: Unprivileged sandboxing tool.
      # End of Sandboxing Tools

      # Management Utilities
      #- Social media cleanup tools
      redact # GUI: The only platform that allows you to automatically clean up your old posts from services like Twitter, Reddit, Facebook, Discord, and more, all in one place.
      # End of Social media cleanup tools
      # End of Useful Utilities

      # Virtualization Tools
      distrobox # CLI: Wrapper around Podman or Docker for creating containers.
      distrobox-tui # CLI: A TUI for DistroBox.
      boxbuddy # GUI: Unofficial GUI for managing your Distroboxes.
      lazydocker # TUI: Terminal UI for Docker and Docker Compose.
      podman-tui # TUI: Podman Terminal UI.
      junest # CLI: Arch Linux distribution that runs on top of another without root.
      boxbuddy # GUI: Unofficial GUI for managing your Distroboxes, written with GTK4 + Libadwaita.
      gnome-boxes # GUI: GNOME application for accessing virtual systems.
      /*
      virt-manager # GUI: Graphical tool for managing virtual machines.
      docker-ls # CLI: Tools for browsing and manipulating Docker registries.
      docker-gc # CLI: Docker garbage collection tool.
      docker-sync # CLI: Synchronizes code for development in Docker containers.
      dive # cli: Tool for exploring each layer in a docker image
      */
      # End of Virtualization Tools

      # Cryptocurrency
      /*
      monero-gui # GUI: Monero GUI wallet.
      electrum # GUI: Lightweight Bitcoin wallet.
      electrum-ltc # GUI: Lightweight Litecoin Client.
      electrum-grs # GUI: Lightweight Groestlcoin wallet.
      */
      # End of Cryptocurrency

      # System Cleaners
      bleachbit # GUI: System cleaner and disk space liberator.
      czkawka # GUI: App to remove unnecessary files.
      # End of System Cleaners

      # Games
      /*
      chessx # GUI: Browse and analyze chess games.
      scid # GUI: Chess database with play and training functionality.
      gnuchess # GUI: GNU Chess engine with a GUI.
      #- Chess Engines
      stockfish # Engine: Strong open-source chess engine.
      fairymax # Engine: Chess engine supporting fairy pieces.
      #- End of Chess Engines
      kdePackages.knights # GUI: Chess game for KDE.
      */
      # End of Games

      # Eye Candy
      cavalcade # GUI: Python wrapper for C.A.V.A. utility with a GUI.
      /*
      cava # CLI: Console-based audio visualizer.
      */
      # End of Eye Candy

      # System Information Fetchers
      onefetch # CLI: Displays Git repository summary.
      neofetch # CLI: Customizable system information script.
      cpufetch # CLI: Fetches CPU architecture information.
      ramfetch # CLI: Displays memory information.
      nur.repos.vanilla.fastfetch # CLI: Faster fork of Neofetch written in C.
      # End of System Information Fetchers

      # Download Managers
      wget # CLI: Tool for retrieving files using HTTP, HTTPS, and FTP.
      wget2 # CLI: Successor to GNU Wget.
      motrix # GUI: Feature-rich download manager.
      uget # GUI: Download manager using GTK and libcurl.
      /*
      curlFull # CLI: Command-line tool for transferring data with URL syntax.
      aria2 # CLI: Lightweight multi-protocol download utility.
      ariang # WEB: Web frontend for Aria2.
      uget-integrator # PLUGIN: Integrates uGet with web browsers.
      */
      # End of Download Managers

      # Torrent Clients and Tools
      qbittorrent # GUI: Feature-rich BitTorrent client. For plugins: <https://github.com/qbittorrent/search-plugins>
      tribler # GUI: Decentralized P2P file sharing client.
      biglybt # GUI: BitTorrent client based on the Azureus that supports I2P darknet for privacy.
      bitcomet # GUI: Free BitTorrent download client.
      webtorrent_desktop # GUI: Streaming torrent app.
      popcorntime # GUI: Streams movies and TV shows from torrents.
      /*
      miru # GUI: Streams anime torrents in real-time.
      qbittorrent-enhanced # GUI: qBittorrent with additional features (community enhancements).
      multiplex # GUI: Watch torrents with friends.
      btfs # CLI: BitTorrent filesystem based on FUSE.
      jesec-rtorrent # CLI: Ncurses client for libtorrent.
      transmission # CLI: Fast and easy BitTorrent client.
      transmission-gtk # GUI: GTK interface for Transmission.
      deluge-gtk # GUI: Lightweight, cross-platform BitTorrent client.
      flood # WEB: Modern web UI for torrent clients.
      */
      # End of Torrent Clients and Tools

      # Downloaders
      #- Matrix
      matrix-commander # CLI: Simple but convenient CLI-based Matrix client app for sending and receiving.
      matrix-commander-rs # CLI: CLI-based Matrix client app for sending, receiving and much more.
      # End of Matrix
      #- Telegram
      tdl # CLI: Telegram downloader/tools written in Golang.
      tg-archive # CLI: A tool for exporting Telegram group chats into static websites like mailing list archives.
      # End of Telegram
      #- YouTube/Spotify/SoundCloud
      ytmdl # CLI: CLI tool to download music from YouTube.
      spotdl # CLI: Spotify downloader.
      scdl # CLI: SoundCloud downloader.
      tartube-yt-dlp # GUI: GUI frontend for youtube-dl and yt-dlp.
      yt-dlg # GUI: Cross-platform GUI for youtube-dl.
      /*
      streamrip # CLI: Scriptable music downloader for Qobuz, Tidal, SoundCloud, and Deezer.
      yt-dlp # CLI: Fork of youtube-dl with additional features.
      youtube-dl # CLI: Tool to download videos from YouTube and other sites (unmaintained).
      */
      # End of YouTube/Spotify/SoundCloud Downloaders
      #- Anime/Manga downloaders
      jhentai # GUI: Cross-platform manga app made for e-hentai & exhentai by Flutter.
      hakuneko # GUI: Manga & Anime Downloader.
      ani-cli # CLI: Cli tool to browse and play anime.
      animdl # CLI: Highly efficient, powerful and fast anime scraper.
      adl # CLI: Popcorn anime scraper/downloader + trackma wrapper.
      ani-skip # CLI: Automated solution to bypassing anime opening and ending sequences.
      mangayomi # GUI: Read manga and stream anime from a variety of sources including BitTorrent.
      mangal # CLI: CLI app written in Go which scrapes, downloads and packs manga into different formats.
      manga-tui # TUI: Terminal-based manga reader and downloader with image support.
      manga-cli # CLI: Bash script for reading mangas via the terminal by scraping manganato.
      mloader # CLI: Command-line tool to download manga from mangaplus.
      comic-mandown # CLI: Comic/manga/webtoon downloader and CBZ/EPUB/MOBI/PDF converter.
      miru # GUI: Stream anime torrents, real-time with no waiting for downloads.
      # End of Anime/Manga downloaders
      # End of Downloaders

      # Research Tools
      /*
      zotero # GUI: Collect, organize, cite, and share your research sources.
      zotero-beta # GUI: Beta version of Zotero.
      polymake # GUI: Software for research in polyhedral geometry.
      yara-x # CLI: Tool to do pattern matching for malware research by VirusTotal.
      /*
      # End of Research Tools

      # Nim
      /*
      nim-unwrapped # CLI: Statically typed, imperative programming language.
      nph # CLI: Opinionated code formatter for Nim.
      */
      # End of Nim

      # Messaging and Chat Clients
      telegram-desktop # GUI: Official Telegram Desktop app.
      session-desktop # GUI: Onion routing based messenger.
      keybase-gui # GUI: Keybase GUI client.
      revolt-desktop # GUI: Open-source chat platform.
      slack # GUI: Desktop client for Slack.
      zulip # GUI: Desktop client for Zulip Chat.
      simplex-chat-desktop # GUI: Desktop app for SimpleX Chat.
      rocketchat-desktop # GUI: Desktop client for Rocket.Chat.
      /*
      _64gram # GUI: Unofficial Telegram Desktop providing Windows 64bit build and extra features.
      qtox # GUI: Qt Tox client.
      wire-desktop # GUI: Secure messenger.
      */
      #- Discord
      #-- Discord Clients
      vesktop # GUI: Alternate Discord client by Vencord with built-in features.
      discord # GUI: Official Discord client.
      discord-ptb # GUI: Discord Public Test Build.
      discord-canary # GUI: Discord Canary Build.
      discord-development # GUI: Discord Development Build.
      legcord # GUI: Lightweight, alternative desktop client for Discord.
      webcord # GUI: A Discord and SpaceBar electron-based client implemented without Discord API.
      ripcord # GUI: Proprietary client for Discord and Slack.
      betterdiscordctl # CLI: Utility for managing BetterDiscord.
      cordless # TUI: Discord terminal client.
      dorion # GUI: Tiny alternative Discord client.
      discordo # TUI: Lightweight, secure, and feature-rich Discord terminal client.
      equibop # GUI: Custom Discord App aiming to give you better performance and improve linux support.
      equicord # GUI: The other cutest Discord client mod.
      abaddon # GUI: A discord client reimplementation, written in C++.
      goofcord # GUI: Highly configurable and privacy-focused Discord client.
      dissent # GUI: A third-party Discord client designed for a smooth, native experience (formerly gtkcord4).
      #-- End of Discord Clients
      #-- Discord Miscellaneous
      /*
      premid # CLI: Shows web activity as playing status on Discord.
      */
      #-- End of Discord Miscellaneous
      #- Matrix Clients
      element-desktop # GUI: Popular Matrix client.
      kdePackages.neochat # GUI: KDE Matrix client.
      fractal # GUI: Matrix group messaging app.
      nheko # GUI: Desktop client for the Matrix protocol.
      cinny-desktop # GUI: Matrix client for desktop.
      fluffychat # GUI: Matrix client with a focus on simplicity.
      /*
      element-desktop-wayland # GUI: Element with Wayland support.
      schildichat-desktop # GUI: Matrix client based on Element (removed from Nixpkgs due to security concerns).
      */
      #- End of Matrix Clients
      #- XMPP/Jabber Clients
      dino # GUI: Modern Jabber/XMPP client using GTK/Vala.
      #- End of XMPP/Jabber Clients
      zapzap # GUI: WhatsApp desktop application for Linux.
      whatsie # GUI: Feature rich WhatsApp Client for Desktop Linux.
      signal-desktop # GUI: Private, secure messenger.
      /*
      threema-desktop # GUI: Desktop client for Threema.
      gitter # GUI: Chat platform for developers (abandoned by upstream).
      keybase # CLI: Keybase command-line utility and service.
      */
      # End of Messaging and Chat Clients

      # Media Players and Tools
      #- Video Players
      vlc # GUI: Versatile media player.
      /*
      mpv # CLI: Powerful media player.
      */
      #- End of Video Players
      #- Image Viewers
      gthumb # GUI: Image browser and viewer for GNOME.
      eog # GUI: GNOME image viewer.
      pix # GUI: Image viewer from Linux Mint.
      pineapple-pictures # GUI: Lightweight image viewer.
      loupe # GUI: Simple image viewer written in GTK4 and Rust.
      xviewer # GUI: Image viewer from Linux Mint.
      oculante # GUI: Minimalistic cross-platform image viewer.
      meh # GUI: Minimal image viewer using raw XLib.
      image-roll # GUI: GTK image viewer with basic image manipulation tools.
      kdePackages.gwenview # GUI: KDE image viewer.
      nsxiv # GUI: Suckless X image viewer.
      nomacs # GUI: Qt-based image viewer.
      napari # GUI: Fast, interactive, multi-dimensional image viewer.
      digikam # GUI: Photo management program.
      shotwell # GUI: Photo organizer for GNOME.
      darktable # GUI: Virtual lighttable and darkroom for photographers.
      fim # CLI: Lightweight, customizable image viewer.
      emulsion # GUI: Fast and minimalistic image viewer.
      ahoviewer # GUI: GTK2 image viewer, manga reader, and booru browser.
      /*
      feh # CLI: Lightweight image viewer.
      */
      #- End of Image Viewers
      #- Image Tools
      imagemagickBig # CLI: Suite for creating, editing, and converting images.
      graphicsmagick # CLI: Swiss army knife of image processing.
      #- End of Image Tools
      #- Audio Players
      audacious # GUI: Lightweight and versatile audio player.
      audacious-plugins # PLUGIN: Plugins for Audacious.
      amberol # GUI: Small and simple audio player.
      lollypop # GUI: Modern music player for GNOME.
      rhythmbox # GUI: Music player for GNOME.
      tauon # GUI: Music player with a futuristic interface.
      mpvc # CLI: MPC-like control interface for mpv.
      exaile # GUI: Music player with a simple interface.
      libsForQt5.vvave # GUI: Multi-platform media player.
      #- End of Audio Players
      #- Audio Controllers
      jamesdsp # GUI: Audio effect processor for PipeWire clients.
      coppwr # GUI: Low level control GUI for the PipeWire multimedia server.
      /*
      easyeffects # GUI: Audio effects for PipeWire applications.
      */
      pavucontrol # GUI: PulseAudio volume control.
      pasystray # Tray: PulseAudio system tray icon.
      #- End of Audio Controllers
      #- Media Tools
      ffmpeg-full # CLI: Complete solution for recording, converting, and streaming audio and video.
      mediainfo # CLI: Provides technical and tag information about media files.
      exiftool # CLI: Tool for reading, writing, and editing EXIF metadata.
      sox # CLI: Sample rate converter for audio.
      #- End of Media Tools
      #- VLC Plugins
      /*
      vlc-bittorrent # PLUGIN: BitTorrent plugin for VLC.
      */
      #- End of VLC Plugins
      # End of Media Players and Tools

      # Entertainment
      # TODO: Use https://github.com/Gerg-L/spicetify-nix to theme Spotify.
      spotify # GUI: Spotify web music player.
      nuclear # GUI: Music streaming app similar to Spotify.
      pipeline # GUI: Watch YouTube and PeerTube videos in one place.
      youtube-music # GUI: Electron wrapper around YouTube Music.
      gtk-pipe-viewer # GUI: GTK-based YouTube client.
      lbry # GUI: Browser and wallet for LBRY.
      /*
      pipe-viewer # CLI: A lightweight YouTube client for Linux, without requiring an API key.
      mov-cli # CLI: Browse and watch movies from the command-line.
      popcorntime # GUI: Streams movies and TV shows from torrents.
      */
      # End of Entertainment

      # PipeWire Tools
      helvum # GUI: GTK patchbay for PipeWire.
      qpwgraph # GUI: Qt graph manager for PipeWire, similar to QjackCtl.
      # End of PipeWire Tools

      # Compression and Archiving Tools
      mate.engrampa # GUI: Archive manager for MATE.
      lxqt.lxqt-archiver # GUI: Archive tool for LXQt.
      kdePackages.ark # GUI: KDE archive manager.
      xarchiver # GUI: GTK frontend for various archive formats (open and extract only).
      archiver # GUI: Create and extract archives, compress and decompress files.
      file-roller # GUI: Archive manager from GNOME.
      brotli # CLI: Generic-purpose lossless compression algorithm and tool.
      lz4 # CLI: Extremely fast compression algorithm.
      zip # CLI: Compressor/archiver for ZIP files.
      pigz # CLI: Parallel implementation of gzip.
      gzip # CLI: GNU compression utility.
      rzip # CLI: Large-file compression program.
      lrzip # CLI: CK LRZIP compression program (LZMA + RZIP).
      zopfli # CLI: High-compression deflate/zlib compressor.
      bzip2 # CLI: High-quality data compression program.
      bzip3 # CLI: Improved successor to BZip2.
      lbzip2 # CLI: Parallel bzip2 compression utility.
      xz # CLI: General-purpose data compression software.
      zstd # CLI: Zstandard real-time compression algorithm.
      unzip # CLI: Extraction utility for ZIP archives.
      p7zip # CLI: 7z archiver with additional codecs and improvements.
      plzip # CLI: Parallel lzlib-based data compressor.
      snzip # CLI: Snappy-based compression/decompression tool.
      crabz # CLI: Rust-based parallel compression tool like pigz.
      rar # CLI: Utility for RAR archives.
      libarchive-qt # GUI: A Qt based archiving solution with libarchive backend.
      xar # CLI: Extensible archiver.
      peazip # GUI: Cross-platform file and archive manager.
      /*
      p7zip-rar # CLI: RAR codec for 7-Zip.
      */
      # End of Compression and Archiving Tools

      # Document Viewers
      sioyek # GUI: PDF viewer designed for research papers and technical books.
      evince # GUI: GNOME document viewer.
      mate.atril # GUI: Multi-page document viewer for MATE.
      kdePackages.okular # GUI: KDE document viewer.
      zathura # GUI: Highly customizable PDF viewer.
      llpp # GUI: MuPDF-based PDF pager written in OCaml.
      mupdf # GUI: Lightweight PDF, XPS, and ebook viewer.
      qpdfview # GUI: Tabbed PDF viewer.
      calibre # GUI: Comprehensive ebook management software.
      librum # GUI: Ebook reader focused on simplicity and enjoyment.
      foliate # GUI: Simple and modern GTK ebook reader.
      koreader # GUI: Ebook reader supporting various formats.
      xreader # GUI: Document viewer for PDF, Postscript, and other formats.
      # End of Document Viewers

      # File Managers
      /*
      kdePackages.dolphin # GUI: KDE file manager.
      kdePackages.dolphin-plugins # PLUGIN: Plugins for Dolphin.
      krusader # GUI: Twin-panel file manager for KDE.
      spaceFM # GUI: Multi-panel tabbed file manager.
      pcmanfm # GUI: File manager with GTK interface.
      */
      # End of File Managers

      # Terminal Emulators
      waveterm # GUI: Open-source, cross-platform terminal for seamless workflows.
      warp-terminal # GUI: The modern intelligent terminal.
      xfce.xfce4-terminal # GUI: Modern terminal emulator for the Xfce desktop.
      mate.mate-terminal # GUI: Terminal emulator for MATE.
      lxterminal # GUI: Standard terminal emulator of LXDE.
      blackbox-terminal # GUI: Beautiful GTK 4 terminal.
      /*
      kitty # GUI: GPU-accelerated terminal emulator.
      alacritty # GUI: GPU-accelerated terminal emulator.
      wezterm # GUI: GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust.
      */
      # End of Terminal Emulators

      # Application Launchers and Menus
      /*
      bemenu # GUI: Dynamic menu inspired by dmenu.
      #- X11 Launchers
      rofi # GUI: Window switcher, run dialog, and dmenu replacement for X11.
      dmenu # GUI: Generic, customizable menu for X11.
      #- Wayland Launchers
      rofi-wayland # GUI: Rofi for Wayland.
      */
      # End of Application Launchers and Menus

      # Clipboard Managers
      xclip # CLI: Accesses the X clipboard from the command-line.
      copyq # GUI: Clipboard manager with advanced features.
      #- <https://wiki.hyprland.org/Useful-Utilities/Clipboard-Managers>
      /*
      parcellite # GUI: Lightweight GTK clipboard manager.
      xsel # CLI: Command-line tool for interacting with the X selection.
      */
      # End of Clipboard Managers

      # Lockscreen
      i3lock-fancy-rapid # GUI: Fast and customizable lockscreen for i3wm.
      /*
      betterlockscreen # GUI: Fast and visually appealing lockscreen with effects.
      */
      # End of Lockscreen

      # System Monitoring Widgets
      /*
      conky # GUI: Advanced, configurable system monitor.
      eww # GUI: ElKowar's wacky widgets for desktops.
      */
      # End of System Monitoring Widgets

      # Benchmarking Tools
      /*
      phoronix-test-suite # CLI: Open-source benchmarking and testing suite.
      hyperfine # CLI: Fast command-line benchmarking tool written in Rust.
      */
      # End of Benchmarking Tools

      # IRC Clients
      /*
      hexchat # GUI: Popular graphical IRC client.
      pidgin # GUI: Multi-protocol instant messaging client.
      irssi # CLI: Terminal-based IRC client.
      weechat # CLI: Fast, light, and extensible chat client.
      gnome.polari # GUI: GNOME IRC client.
      */
      # End of IRC Clients

      # RSS/Atom Feed Readers
      /*
      liferea # GUI: GTK-based RSS/Atom feed reader.
      gnome-feeds # GUI: RSS/Atom feed reader for GNOME.
      */
      # End of RSS/Atom Feed Readers

      # Fractal Engines
      /*
      mandelbulber # GUI: 3D fractal rendering engine.
      */
      # End of Fractal Engines

      # Screen and Audio Recorders
      #- OBS Studio
      /*
      obs-studio # GUI: Free and open-source software for video recording and live streaming.
      obs-studio-plugins.obs-vaapi # PLUGIN: VAAPI support for OBS Studio.
      obs-studio-plugins.obs-vkcapture # PLUGIN: Vulkan/OpenGL game capture for OBS Studio.
      obs-studio-plugins.obs-gstreamer # PLUGIN: GStreamer plugin for OBS Studio.
      obs-studio-plugins.input-overlay # PLUGIN: Shows keyboard, gamepad, and mouse input on stream.
      obs-studio-plugins.obs-pipewire-audio-capture # PLUGIN: PipeWire audio capture for OBS Studio.
      obs-studio-plugins.obs-nvfbc # PLUGIN: NVIDIA FBC API plugin for OBS Studio.
      gpu-screen-recorder # CLI: GPU-accelerated screen recorder.
      gpu-screen-recorder-gtk # GUI: GUI for gpu-screen-recorder.
      */
      #- End of OBS Studio
      peek # GUI: Simple animated GIF screen recorder.
      vhs # CLI: Generates terminal GIFs.
      #- Asciinema
      asciinema # CLI: Terminal session recorder.
      asciinema-agg # CLI: Generates animated GIFs from asciinema recordings.
      asciinema-scenario # CLI: Creates asciinema videos from a text file.
      #- End of Asciinema
      # End of Screen and Audio Recorders

      # Audio and Video Editors
      #- Audio Editors
      audacity # GUI: Sound editor with a graphical interface.
      ardour # GUI: Multi-track hard disk recording software.
      #- End of Audio Editors
      #- Video Editors
      losslesscut-bin # GUI: Lossless video/audio editor.
      openshot-qt # GUI: Free, open-source video editor.
      kdePackages.kdenlive # GUI: KDE video editor.
      kdePackages.kwave # GUI: KDE sound editor.
      lightworks # GUI: Professional non-linear video editor.
      flowblade # GUI: Multitrack non-linear video editor.
      olive-editor # GUI: Professional open-source NLE video editor.
      shotcut # GUI: Cross-platform video editor.
      pitivi # GUI: Non-linear video editor using GStreamer.
      video-trimmer # GUI: Trims videos quickly.
      #- End of Video Editors
      #- Image Editors
      halftone # GUI: Simple app for giving images that pixel-art style.
      pinta # GUI: Drawing/editing program modeled after Paint.NET.
      #-- Krita
      krita # GUI: Free and open-source painting application.
      krita-plugin-gmic # PLUGIN: GMic plugin for Krita.
      # End of Krita
      #-- GIMP
      gimp-with-plugins # GUI: GNU Image Manipulation Program with plugin support.
      gimpPlugins.gap # PLUGIN: GIMP Animation Package.
      gimpPlugins.gmic # PLUGIN: GIMP plugin for the G'MIC image processing framework.
      gimpPlugins.bimp # PLUGIN: Batch Image Manipulation Plugin for GIMP.
      gimpPlugins.fourier # PLUGIN: Fourier transform plugin for GIMP.
      gimpPlugins.gimplensfun # PLUGIN: Lens distortion correction plugin for GIMP.
      gimpPlugins.farbfeld # PLUGIN: Farbfeld image format plugin for GIMP.
      gimpPlugins.texturize # PLUGIN: Texturize plugin for GIMP.
      gimpPlugins.lqrPlugin # PLUGIN: Liquid Rescale plugin for GIMP.
      gimpPlugins.lightning # PLUGIN: Lightning plugin for GIMP.
      gimpPlugins.waveletSharpen # PLUGIN: Wavelet sharpen plugin for GIMP.
      /*
      gimpPlugins.exposureBlend # PLUGIN: Exposure blending plugin for GIMP.
      gimpPlugins.resynthesizer # PLUGIN: Resynthesizer plugin for GIMP.
      */
      # End of GIMP
      #- End of Image Editors
      #- Vector Graphics and Other Editors
      #-- Inkscape
      inkscape-with-extensions # GUI: Vector graphics editor with extension support.
      inkscape-extensions.hexmap # EXTENSION: Creates hex grids and brick patterns in Inkscape.
      inkscape-extensions.applytransforms # EXTENSION: Removes matrix transforms in Inkscape.
      inkscape-extensions.silhouette # EXTENSION: Extension to drive Silhouette vinyl cutters (e.g. Cameo, Portrait, Curio series) from within Inkscape.
      inkscape-extensions.textext # EXTENSION: Re-editable LaTeX graphics for Inkscape.
      /*
      inkscape-extensions.inkcut # EXTENSION: Inkscape extension for cutting with a plotter.
      */
      # End of Inkscape
      #- End of Vector Graphics and Other Editors
      # End of Audio and Video Editors

      # Data management
      /*
      openrefine # GUI: Power tool for working with messy data and improving it.
      */
      # End of Data management

      # Desktop Customization Tools
      /*
      flashfocus # Daemon: Adds focus animations to tiling window managers.
      #- Wallpaper Managers
      nitrogen # GUI: Wallpaper browser and setter for X11.
      hyprpaper # GUI: Wayland wallpaper utility.
      swww # CLI: Animated wallpaper daemon for Wayland.
      */
      #- End of Wallpaper Managers
      themix-gui # GUI: Theme designer with plugin support.
      lxappearance # GUI: Configures themes and fonts for GTK applications.
      themechanger # GUI: Theme changing utility.
      nwg-look # GUI: Nwg-look is a GTK3 settings editor, designed to work properly in wlroots-based Wayland environment.
      wpgtk # GUI: Wallpaper and colorscheme generator and manager.
      kdePackages.qt6ct # GUI: Qt6 configuration tool.
      libsForQt5.qt5ct # GUI: Qt5 configuration tool.
      libsForQt5.qtstyleplugins # PLUGIN: Additional style plugins for Qt5.
      kdePackages.qtstyleplugin-kvantum # GUI: Qt5 theme engine and configuration tool.
      # End of Desktop Customization Tools

      # Network Management
      networkmanagerapplet # GUI/Tray: NetworkManager applet for GNOME.
      /*
      nm-tray # GUI/Tray: Simple NetworkManager frontend written in Qt.
      */
      # End of Network Management

      # Tor Tools
      /*
      tor # CLI: Anonymizing overlay network.
      torsocks # CLI: Wrapper for torifying applications.
      nyx # CLI: Command-line monitor for Tor.
      orjail # CLI: Forces programs to use the Tor network.
      onionshare-gui # GUI: Securely and anonymously share files.
      */
      # End of Tor Tools

      # Password Managers
      keepassxc # GUI: Offline password manager.
      /*
      bitwarden-desktop # GUI: Secure and free password manager for all of your devices.
      bitwarden-cli # CLI: Command-line interface for Bitwarden.
      proton-pass # GUI: Desktop application for Proton Pass
      */
      # End of Password Managers

      # Status Bars
      /*
      polybarFull # GUI: Fast and easy-to-use status bar.
      */
      # End of Status Bars

      # Compositors
      picom-pijulius-git # Daemon: Picom fork with extensive animation support.
      /*
      picom # Daemon: Compositing manager for X servers.
      fastcompmgr # Daemon: Fast compositor for X11
      neocomp # Daemon: Fork of Compton, a compositor for X11
      */
      # End of Compositors

      # Notification Daemons
      /*
      dunst # Daemon: Lightweight notification daemon for X and Wayland.
      deadd-notification-center # Daemon: Notification center written in Haskell.
      */
      #- Wayland Notification Daemons
      /*
      swaynotificationcenter # Daemon: Notification daemon for Sway.
      mako # Daemon: Lightweight notification daemon for Wayland.
      vizo # Daemon: Notification daemon for Wayland.
      */
      # End of Notification Daemons

      # Font Management
      /*
      font-manager # GUI: Font management application.
      gtk2fontsel # GUI: GTK font selection program.
      */
      # End of Font Management

      # Screenshot Tools
      scrot # CLI: Command-line screenshot utility.
      maim # CLI: Command-line screenshot utility.
      shotgun # CLI: Minimal X screenshot utility.
      /*
      flameshot # GUI: Feature-rich screenshot tool.
      */
      #- Wayland Screenshot Tools
      /*
      shotman # GUI: Screenshot GUI for Wayland compositors.
      grim # CLI: Grabs images from a Wayland compositor.
      slurp # CLI: Selects a region in a Wayland compositor.
      */
      # End of Screenshot Tools

      # Organization and Productivity Tools
      /*
      filebot # CLI: TV and movie renamer.
      obsidian # GUI: Knowledge base that works with Markdown files.
      logseq # GUI: Local-first, outliner notebook for knowledge management.
      zim # GUI: Desktop wiki.
      freeplane # GUI: Mind-mapping software.
      joplin-desktop # GUI: Note-taking and to-do application with synchronization.
      tusk # GUI: Refined Evernote desktop app.
      dupeguru # GUI: Finds duplicate files.
      standardnotes # GUI: Simple and private notes app.
      simplenote # GUI: Minimalist note-taking app.
      zettlr # GUI: Markdown editor for academic writing and note-taking.
      vnote # GUI: Note-taking platform.
      rnote # GUI: Handwritten notes app.
      trilium-desktop # GUI: Hierarchical note-taking app for knowledge bases.
      appflowy # GUI: Open-source alternative to Notion.
      */
      # End of Organization and Productivity Tools

      # Educational Software
      /*
      anki-bin # GUI: Spaced repetition flashcard program (binary version).
      stellarium # GUI: Free and open-source planetarium.
      celestia # GUI: Real-time 3D space simulation.
      kstars # GUI: Virtual planetarium and astronomy software.
      kdePackages.kalzium # GUI: Periodic Table of Elements.
      */
      # End of Educational Software

      # Office Suites
      /*
      gnumeric # GUI: GNOME spreadsheet application.
      libreoffice-fresh # GUI: Productivity suite, a variant of OpenOffice.org.
      calligra # GUI: Suite of productivity applications.
      */
      # End of Office Suites

      # Software Centers
      /*
      gnome.gnome-software # GUI: GNOME software center (supports Flathub).
      kdePackages.discover # GUI: KDE software center (supports Flathub).
      */
      # End of Software Centers

      # Antivirus Software
      /*
      clamav # CLI: Antivirus engine.
      */
      # End of Antivirus Software

      # Media Converters
      handbrake # GUI: Video converter and DVD ripper.
      rawtherapee # GUI: RAW image converter and photo editor.
      # End of Media Converters

      # Calculators
      qalculate-gtk # GUI: Advanced desktop calculator.
      galculator # GUI: GTK algebraic and RPN calculator.
      speedcrunch # GUI: Fast calculator for power users.
      kdePackages.kcalc # GUI: Calculator offering everything a scientific calculator does, and more.
      sums # GUI: Simple GTK postfix calculator for GNOME.
      gnome-calculator # GUI: Application that solves mathematical equations and is suitable as a default application in a Desktop environment.
      # End of Calculators

      # Scientific Software
      /*
      mathematica-cuda # GUI: Wolfram Mathematica with CUDA support.
      octaveFull # GUI: Scientific programming language.
      scilab-bin # GUI: Numerical computation software (Matlab-like).
      gnuplot # GUI: Command-line graphing utility.
      */
      # End of Scientific Software

      # Mathematics Software
      /*
      geogebra # GUI: Dynamic mathematics software.
      */
      # End of Mathematics Software

      # SQL Clients
      /*
      mysql-workbench # GUI: Visual MySQL database tool.
      */
      # End of SQL Clients

      # RSS Readers
      /*
      fluent-reader # GUI: Modern desktop RSS reader.
      raven-reader # GUI: Open-source desktop news reader.
      gnome-feeds # GUI: RSS/Atom feed reader for GNOME.
      rssguard # GUI: RSS/Atom feed reader with online synchronization.
      */
      # End of RSS Readers

      # Automation Tools
      /*
      autokey # GUI: Desktop automation utility.
      */
      # End of Automation Tools

      # Color Pickers
      #- Wayland Color Pickers
      /*
      hyprpicker # CLI: Wayland color picker.
      */
      #- X11 Color Pickers
      gcolor3 # GUI: Color selector.
      gpick # GUI: Advanced color picker.
      eyedropper # GUI: Pick and format colors.
      kdePackages.kcolorchooser # GUI: KDE color chooser.
      kdePackages.kcolorpicker # GUI: Qt based Color Picker with popup menu.
      # End of Color Pickers

      # Electronics/Electrical Engineering Software
      /*
      ngspice # GUI: Electronic circuit simulator.
      logisim-evolution # GUI: Digital logic designer and simulator.
      fritzing # GUI: Prototyping tool for Arduino projects.
      qucs-s # GUI: Circuit simulator with custom simulation kernels.
      librepcb # GUI: EDA software for PCB design.
      geda # GUI: Suite of electronic design automation tools.
      */
      # End of Electronics/Electrical Engineering Software

      # Tumbler Thumbnailers
      # Extend Tumbler's support for various file formats.
      # <https://wiki.archlinux.org/title/File_manager_functionality#Thumbnail_previews>
      webp-pixbuf-loader # LIB: WebP thumbnail support.
      poppler # LIB: PDF thumbnail support.
      ffmpegthumbnailer # LIB: Video thumbnail support.
      gnome-epub-thumbnailer # LIB: EPub and MOBI thumbnail support.
      libgsf # LIB: ODF thumbnail support.
      f3d # LIB: 3D file thumbnail support (glTF, stl, step, ply, obj, fbx).
      mcomix # LIB: Comic book thumbnail support (cbz, cbr).
      # End of Tumbler Thumbnailers

      # VPN Clients
      protonvpn-cli_2 # CLI: ProtonVPN command-line client using OpenVPN.
      protonvpn-gui # GUI: ProtonVPN client.
      /*
      protonvpn-cli # CLI: ProtonVPN command-line client.
      */
      # End of VPN Clients

      # Miscellaneous Tools and Applications
      hydrus # GUI: Image tagging and searching system.
      imgbrd-grabber # GUI: Very customizable imageboard/booru downloader with powerful filenaming features.
      /*
      gallery-dl # CLI: Downloads image galleries from various websites.
      sonic-visualiser # GUI: Music audio analysis tool.
      qtchan # GUI: 4chan browser.
      gnome-podcasts # GUI: Podcast client for GNOME.
      figma-linux # GUI: Unofficial Figma desktop app for Linux.
      mousai # GUI: Music identification tool.
      wike # GUI: Wikipedia reader for GNOME.
      gnome-dictionary # GUI: Dictionary application for GNOME.
      notion-app-enhanced # GUI: Notion desktop app with enhancements.
      typst # CLI: Markup-based typesetting system.
      jitsi # GUI: Open-source video conferencing and chat application.
      */
      # End of Miscellaneous Tools and Applications

      # Libraries
      #- <https://wiki.nixos.org/wiki/FAQ/I_installed_a_library_but_my_compiler_is_not_finding_it._Why%3F>
      #- <https://discourse.nixos.org/t/how-to-install-openssl-to-compile-against/1249>
      /*
      openssl # LIB+CLI: Cryptographic library and tools.
      */
      # End of Libraries

      # USB related
      ventoy-full # CLI: New Bootable USB Solution.
      /*
      etcher # GUI: Flashes OS images to SD cards and USB drives.
      */
      # End of USB related

      # Essential System Utilities
      ddate # CLI: Discordian version of the date program.
      nvtopPackages.full # CLI: GPU task monitor for AMD, Intel, and NVIDIA.
      linux-wifi-hotspot # GUI: Creates Wi-Fi hotspots.
      resources # GUI: System resource monitor.
      mission-center # GUI: Monitor your CPU, Memory, Disk, Network and GPU usage
      monitorets # GUI: Simple and quick view at the usage of your computer resources.
      xfce.xfce4-taskmanager # GUI: XFCE task manager.
      clapgrep # GUI: One app to search through all your files.
      gnome-usage # GUI: System resource usage viewer.
      gnome-disk-utility # GUI: Disk management tool.
      baobab # GUI: Disk usage analyzer for GNOME.
      kdiskmark # GUI: HDD and SSD benchmark tool with a friendly graphical user interface.
      kdePackages.filelight # GUI: Quickly visualize your disk space usage.
      k4dirstat # GUI: Small utility program that sums up disk usage for directory trees.
      wgetpaste # CLI: Command-line interface to pastebin services.
      wmname # CLI: Prints/sets window manager name.
      arandr # GUI: Visual frontend for XRandR.
      libva-utils # CLI: Utilities and examples for VA-API.
      glxinfo # CLI: OpenGL test utilities.
      smartmontools # CLI: Hard drive health monitoring tools.
      nvme-cli # CLI: NVM-Express user space tools.
      hwinfo # CLI: Hardware detection tool.
      cpuid # CLI: Dumps x86 CPUID information.
      pciutils # CLI: Tools for PCI devices.
      usbutils # CLI: Tools for USB devices.
      util-linux # CLI: Set of system utilities.
      inxi # CLI: System information tool.
      nvitop # CLI: NVIDIA GPU process viewer.
      s-tui # CLI: Stress Terminal UI monitoring tool.
      cpu-x # GUI: CPU, motherboard, and system information tool.
      hddtemp # CLI: Tool for displaying hard disk temperature.
      d-spy # GUI: D-Bus exploration tool.
      kernelshark # GUI: GUI for trace-cmd which is an interface for the Linux kernel ftrace subsystem.
      /*
      psensor # GUI: Hardware temperature monitor. (Removed due to lack of maintenance upstream)
      libnotify # LIBRARY/CLI: Sends desktop notifications.
      #- https://github.com/swaywm/sway/wiki/GTK-3-settings-on-Wayland#xsettings
      #- https://wiki.hyprland.org/FAQ/#gtk-settings-no-work--whatever
      xsettingsd # CLI: Provides settings to X11 applications.
      tree # CLI: Displays directory structure as a tree.
      lm_sensors # CLI: Hardware sensor reading tools.
      */
      #- jq - JSON Processor
      jqp # CLI: TUI playground for jq.
      ijq # CLI: Interactive wrapper for jq.
      /*
      jq # CLI: Command-line JSON processor.
      */
      #- End of jq
      #- Filesystem Tools
      hdparm # CLI: Manipulates ATA/SATA drive parameters.
      btrfs-progs # CLI: Utilities for the Btrfs filesystem.
      compsize # CLI: Finds compression type/ratio on Btrfs files.
      exfatprogs # CLI: exFAT filesystem utilities.
      e2fsprogs # CLI: Tools for ext2/ext3/ext4 filesystems.
      duff # CLI: Finds duplicate files.
      dua # CLI: Learns about disk usage of directories.
      # End of Filesystem Tools
      filezilla # GUI: FTP, FTPS, and SFTP client.
      /*
      zenith-nvidia # CLI: System monitor with zoom-able charts and NVIDIA GPU usage.
      glances # CLI: Curses-based system monitor.
      gpu-viewer # GUI: Frontend for glxinfo, vulkaninfo, clinfo, and es2_info.
      curtail # GUI: Image compressor.
      hamster # GUI: Time tracking application.
      ngrok # CLI: Exposes local web servers to the internet.
      treefmt # CLI: Formats code trees.
      cpupower-gui # GUI: GUI for cpupower.
      zenmonitor # GUI: Monitoring software for AMD Zen CPUs.
      doge # CLI: Displays Doge in the terminal.
      terminal-parrot # CLI: Shows animated party parrot in the terminal.
      shadowfox # CLI: Universal dark theme for Firefox.
      ocs-url # CLI: Open Collaboration System for store websites.
      dua # CLI: Disk usage analyzer.
      vnstat # CLI: Network statistics utility.
      nload # CLI: Network traffic and bandwidth monitor.
      alsa-utils # CLI: ALSA utilities.
      pydf # CLI: Colorized 'df' clone.
      tmux # CLI: Terminal multiplexer.
      tmate # CLI: Instant terminal sharing.
      krename # GUI: Batch renamer for KDE.
      eaglemode # GUI: Zoomable user interface.
      mat2 # CLI: Metadata removal tool.
      wayland-utils # CLI: Wayland utilities (wayland-info).
      wdisplays # GUI: Graphical application for configuring Wayland displays.
      */
      # End of Essential System Utilities

      # Remote Desktop Clients
      /*
      teamviewer # GUI: Proprietary remote desktop software.
      rustdesk # GUI: Free and open-source remote desktop software.
      anydesk # GUI: Proprietary remote desktop software.
      */
      # End of Remote Desktop Clients

      # Firewall
      /*
      opensnitch # CLI: Application-level firewall.
      opensnitch-ui # GUI: GUI for OpenSnitch.
      */
      # End of Firewall

      # Network Diagnostics
      /*
      ooniprobe-cli # CLI: Network interference probe.
      */
      # End of Network Diagnostics

      # Gaming and Windows Compatibility
      #- Games
      /*
      osu-lazer # GUI: Rhythm is just a *click* away (no score submission or multiplayer, see osu-lazer-bin).
      osu-lazer-bin # GUI: Rhythm is just a *click* away (AppImage version for score submission and multiplayer, and binary distribution for Darwin systems).
      (fufexan/nix-gaming) osu-lazer-bin # GUI: osu! lazer, extracted from the official AppImage.
      (fufexan/nix-gaming) osu-stable # GUI: osu! stable version.
      */
      # End of Games
      #- Gamepad Controllers
      antimicrox # GUI: Maps keyboard and mouse to gamepads.
      gamepad-tool # GUI: Creates/modifies gamepad mappings for SDL2 games.
      # End of Gamepad Controllers
      #- Wine
      wineWowPackages.stagingFull # CLI: Wine with Staging patches (version with experimental features).
      winetricks # GUI: Installs DLLs and components for Wine (all versions).
      bottles # GUI: Wine prefix manager.
      /*
      bottles-unwrapped # GUI: Wine prefix manager.
      wineWow64Packages.waylandFull # CLI: Wine with experimental native Wayland support.
      */
      #- Proton
      protonup-ng # CLI: CLI program and API to automate the installation and update of GloriousEggroll's Proton-GE.
      protonplus # GUI: Simple Wine and Proton-based compatibility tools manager.
      protontricks # CLI: Runs Winetricks commands for Proton games.
      protonup-qt # GUI: Manages Proton-GE and Luxtorpeda for Steam and Wine-GE for Lutris.
      #- Game Launchers
      heroic # GUI: Native GOG, Epic, and Amazon Games Launcher for Linux, Windows and MacOS.
      cartridges # GUI: GTK4 + Libadwaita game launcher.
      itch # GUI: Best way to play itch.io games.
      lutris # GUI: Open-source gaming platform for Linux.
      # End of Game Launchers
      /*
      lutris-unwrapped # GUI: Open-source gaming platform for Linux.
      mangohud # CLI: Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more.
      */
      # End of Gaming and Windows Compatibility

      # Game Misc
      /*
      factoriolab # WEBUI: Angular-based calculator for factory games like Factorio, Dyson Sphere Program, Satisfactory, Captain of Industry, Techtonica and Final Factory.
      */
      # End of Game Misc

      # Experimental Nix Tools
      /*
      nix-software-center # GUI: GTK4 software center for Nix packages.
      nixos-conf-editor # GUI: Libadwaita app for editing NixOS configurations.
      nix-editor # CLI: Command-line tool for modifying NixOS configuration values.
      snow # CLI: Command-line wrapper for Nix.
      */
      # End of Experimental Nix Tools

      # Misc Tools
      goverlay # LIB: Opensource project that aims to create a Graphical UI to help manage Linux overlays.
      fuse-overlayfs # LIB: FUSE implementation for overlayfs.
      dwarfs # LIB: Fast high compression read-only file system.
      zenity # GUI: Tool to display dialogs from the commandline and shell scripts.
      dmidecode # CLI: Tool that reads information about your system's hardware from the BIOS according to the SMBIOS/DMI standard.
      stress # CLI: Simple workload generator for POSIX systems. It imposes a configurable amount of CPU, memory, I/O, and disk stress on the system.
      mokutil # CLI: Utility to manipulate machines owner keys.
      efibootmgr # CLI: Linux user-space application to modify the Intel Extensible Firmware Interface (EFI) Boot Manager.
      /*
      kando # GUI/MENU: Cross-Platform Pie Menu.
      spicetify-cli # CLI: Command-line tool to customize Spotify client.
      */
      # End of Misc Tools
    ];
  };
}
