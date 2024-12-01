# Home Manager User's Packages Configuration
_: let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
  #- App Data Locations
  /*
  Data: /var/lib/<pkg>/
  NixOS Applications (.desktops): /run/current-system/sw/share/applications/
  Home-manager Applications (.desktops): ~/.local/state/home-manager/gcroots/current-home/home-path/share/applications/
  */
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.user = {pkgs, ...}: {
    home.packages = with pkgs; [
      # Code editors
      code-cursor # GUI: AI-powered code editor built on vscode
      /*
      neovide # GUI: Neovim GUI with enhanced features like animations and ligatures.
      emacs # CLI: The extensible, customizable GNU text editor.
      vim # CLI: The most popular clone of the VI editor.
      neovim # CLI: A Vim fork focused on extensibility and agility.
      lite-xl # GUI: Lightweight text editor written in Lua.
      micro # CLI: Modern and intuitive terminal-based text editor.
      mate.pluma # GUI: Powerful text editor for the MATE desktop environment.
      nano # CLI: Small, user-friendly console text editor.
      kibi # CLI: Text editor in ≤1024 lines of code, written in Rust.
      zed-editor # GUI: High-performance, collaborative code editor from the creators of Atom and Tree-sitter.
      ox # CLI: Independent Rust-based text editor.
      lapce # GUI: Lightning-fast and powerful code editor written in Rust.
      helix # CLI: Post-modern text editor.
      amp # CLI: Modern text editor inspired by Vim.
      */
      # End of Code editors

      # AI/Machine Learning
      /*
      nur.repos.some-pkgs.llama-cpp # CLI: Port of Facebook's LLaMA model in C/C++ (master branch).
      llama-cpp # CLI: Port of Facebook's LLaMA model in C/C++.
      */
      # End of AI/Machine Learning

      # Development Tools
      shellcheck # CLI: Static analysis tool for shell scripts.
      shfmt # CLI: Shell script formatter.
      wakatime # CLI: Tracks time spent on projects.
      gitkraken # GUI: Popular Git client with a user-friendly interface.
      just # CLI: Saves and runs project-specific commands.
      github-desktop # GUI: GUI for managing Git repositories and interacting with GitHub.
      meld # GUI: Visual diff and merge tool.
      code2prompt # CLI: Converts codebases into LLM prompts with source tree, templating, and token counting.
      /*
      act # CLI: Run your GitHub Actions locally.
      serie # CLI: Displays a rich Git commit graph in your terminal.
      github-copilot-cli # CLI: Command-line interface for GitHub Copilot.
      shellharden # CLI: Corrective bash syntax highlighter.
      processing # GUI: Language and IDE for electronic arts and visual programming.
      sqlite # CLI: Self-contained, serverless, zero-configuration SQL database engine.
      sqliteman # GUI: Simple but powerful SQLite GUI database manager.
      polypane # GUI: Browser with unified devtools focused on responsiveness and accessibility.
      spyder # GUI: Scientific Python development environment.
      racket # GUI: General-purpose multi-paradigm programming language with Dr. Racket IDE.
      libsForQt5.kompare # GUI: Diff/patch frontend for KDE.
      diffuse # GUI: Graphical tool for merging and comparing text files.
      linkchecker # CLI: Checks websites for broken links.
      shc # CLI: Shell script compiler.
      git-cola # GUI: Sleek and powerful Git GUI.
      gitg # GUI: GNOME GUI client to view Git repositories.
      gitoxide # CLI: Command-line application for interacting with Git repositories.
      mercurialFull # CLI: Fast, lightweight SCM system for large distributed projects (full version).
      sqlite-web # WEB: Web-based SQLite database browser.
      sqlitebrowser # GUI: DB Browser for SQLite.
      */
      # End of Development Tools

      # Android
      /*
      gnirehtet # CLI: Reverse tethering over adb for Android
      scrcpy # CLI: Display and control Android devices over USB or TCP/IP
      android-file-transfer # GUI: Reliable MTP client with minimalistic UI
      agi # GUI: Android GPU Inspector by Google
      aemu # UTIL: Android emulation utilities library
      android-studio-full # GUI: Official IDE for Android development (Stable channel)
      androidStudioPackages.dev # GUI: Android Studio development packages (Dev channel)
      androidStudioPackages.canary # GUI: Android Studio development packages (Canary channel)
      androidStudioPackages.beta # GUI: Android Studio development packages (Beta channel)
      android-studio-tools # CLI: Command-line tools for Android Studio
      android-studio-for-platform # GUI: The Official IDE for Android platform development
      universal-android-debloater # GUI: Tool to debloat non-rooted Android devices
      trueseeing # CLI: Non-decompiling Android vulnerability scanner
      apktool # CLI: Tool for reverse engineering Android apk files
      androguard # CLI/LIB: Reverse engineering and pentesting for Android applications
      apksigner # CLI: Command line tool to sign and verify Android APKs
      ghost # CLI: An Android post-exploitation framework that exploits the Android Debug Bridge to remotely access an Android device
      anbox # GUI: Android in a box
      genymotion # GUI: Fast and easy Android emulation
      waydroid # GUI: Container-based approach to boot a full Android system on a regular GNU/Linux system
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
      /*
      nodejs # CLI: Event-driven I/O framework for the V8 JavaScript engine.
      yarn # CLI: Fast, reliable, and secure dependency management for JavaScript.
      nodePackages.npm # CLI: Package manager for JavaScript.
      nodenv # CLI: Manage multiple Node.js versions.
      node2nix # CLI: Generate Nix expressions to build NPM packages.
      yarn2nix # CLI: Convert packages.json and yarn.lock into a Nix expression.
      */
      # End of JavaScript Development

      # File Sharing
      /*
      localsend # GUI: Open source cross-platform alternative to AirDrop.
      libsForQt5.kdeconnect-kde # GUI: KDE Connect integrates phone and computer.
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

      # Command-Line Utilities
      argc # CLI: Command-line options, arguments, and sub-commands parser for Bash.
      bat # CLI: Cat clone with syntax highlighting and Git integration.
      grc # CLI: Generic text colorizer.
      broot # CLI: Interactive tree view, fuzzy search, and customizable commands.
      cod # Daemon: Generates Bash/Fish/Zsh autocompletions based on `--help` output.
      mcfly # CLI: Enhanced Ctrl-R for smarter history search.
      skim # CLI: Command-line fuzzy finder written in Rust.
      ripgrep # CLI: Fast and powerful search tool.
      fzf # CLI: Command-line fuzzy finder written in Go.
      zoxide # CLI: Fast 'cd' command that learns your habits.
      /*
      rm-improved # CLI: Safer and more ergonomic replacement for 'rm'.
      exa # CLI: Modern replacement for 'ls' written in Rust.
      eza # CLI: Modern, maintained replacement for 'ls'.
      navi # CLI: Interactive cheatsheet tool for the command-line.
      progress # CLI: Shows the progress of coreutils programs.
      gping # CLI: Ping with a graphical representation.
      atuin # CLI: Shell history replacement with context recording and optional sync.
      glow # CLI: Renders Markdown on the CLI with styling.
      tealdeer # CLI: Very fast implementation of tldr in Rust.
      cheat # CLI: Create and view interactive cheatsheets.
      imgcat # CLI: Displays images in the terminal.
      noti # CLI: Monitors a process and triggers a notification.
      du-dust # CLI: Disk usage analyzer like 'du' but more intuitive.
      duf # CLI: Disk Usage/Free Utility.
      sd # CLI: Intuitive find & replace CLI (sed alternative).
      procs # CLI: Modern replacement for 'ps' written in Rust.
      tokei # CLI: Counts lines of code.
      runiq # CLI: Filters duplicate lines from input.
      choose # CLI: Human-friendly alternative to 'cut' and 'awk'.
      watchexec # CLI: Executes commands in response to file modifications.
      bandwhich # CLI: Displays current network utilization.
      kmon # CLI: Linux Kernel Manager and Activity Monitor.
      grex # CLI: Generates regular expressions from test cases.
      ouch # CLI: Compresses and decompresses files and directories.
      fclones # CLI: Efficient duplicate file finder and remover.
      ruplacer # CLI: Find and replace text in source files.
      eva # CLI: Calculator REPL, similar to 'bc'.
      ddgr # CLI: DuckDuckGo search from the terminal.
      xplr # CLI: Hackable, minimal, fast TUI file explorer.
      yq # CLI: Command-line YAML/XML/TOML processor.
      cointop # CLI: Terminal-based UI for tracking cryptocurrencies.
      fd # CLI: Simple, fast, and user-friendly alternative to 'find'.
      ripgrep-all # CLI: Ripgrep with support for various file formats.
      */
      # End of Command-Line Utilities

      # Scanners
      #- Secret scanners
      trufflehog # CLI: Finds and verifies secrets in code and files.
      gitleaks # CLI: Scans Git repositories for secrets.
      # End of Secret scanners
      #- Vulnerability scanners
      vulnix # CLI: NixOS vulnerability scanner.
      grype # CLI: Vulnerability scanner for container images and filesystems.
      # End of vulnerability scanners
      # End of Scanners

      # Fun/Novelty Tools
      /*
      cmatrix # CLI: Simulates The Matrix "falling code" effect.
      figlet # CLI: Creates large letters from text.
      lolcat # CLI: Rainbow-colored 'cat'.
      gay # CLI: Colors text with rainbow colors.
      cowsay # CLI: Generates ASCII pictures of a cow with a message.
      ponysay # CLI: Cowsay reimplementation with ponies.
      pokemonsay # CLI: Prints Pokémon in the CLI.
      cbonsai # CLI: Grows bonsai trees in your terminal.
      genact # CLI: Nonsense activity generator.
      */
      # End of Fun/Novelty Tools

      # Nix Tools
      nixd # Daemon: Nix language server.
      alejandra # CLI: Nix code formatter.
      statix # CLI: Linter and code suggestion tool for Nix.
      deadnix # CLI: Finds and removes unused code in Nix files.
      /*
      nix-web # WEB: Web interface for the Nix store.
      nixfmt # CLI: Nix code formatter.
      appimage-run # CLI: Runs AppImages on NixOS.
      # <https://github.com/NixOS/nixpkgs/issues/232640>
      steam-run # CLI: Runs commands in the Steam FHS environment.
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
      /*
      nicotine-plus # GUI: Modern and maintained graphical client for the SoulSeek peer-to-peer system.
      */
      # End of P2P File Sharing

      # Email Clients
      /*
      betterbird # GUI: Enhanced version of Mozilla Thunderbird.
      thunderbird # GUI: Full-featured email client from Mozilla.
      electron-mail # GUI: Electron-based ProtonMail client.
      tutanota-desktop # GUI: Electron-based Tutanota client.
      claws-mail # GUI: User-friendly, lightweight email client.
      geary # GUI: Email client for GNOME 3.
      */
      # End of Email Clients

      # Reverse Engineering Tools
      /*
      ghidra # GUI: Software reverse engineering suite from NSA.
      radare2 # CLI: Reverse engineering framework and command-line tools.
      iaito # GUI: Graphical interface for Radare2.
      cutter # GUI: Free and open-source reverse engineering platform.
      imhex # GUI: Hex editor for reverse engineers and programmers.
      rizin # CLI: Reverse engineering framework and command-line tools.
      apktool # CLI: Tool for reverse engineering Android apk files
      androguard # CLI/LIB: Reverse engineering and pentesting for Android applications
      */
      # End of Reverse Engineering Tools

      # Password Cracking
      /*
      cook-framework # CLI: An overpowered wordlist manager.
      hashcat # CLI: Advanced password recovery utility.
      hashcat-utils # CLI: Utilities for hashcat.
      john # CLI: John the Ripper password cracker.
      johnny # CLI: GUI for John the Ripper.
      */
      # End of Password Cracking

      # Debuggers
      /*
      strace # CLI: System call tracer.
      valgrind # CLI: Debugging and profiling tool suite.
      */
      # End of Debuggers

      # CAD Software
      /*
      freecad # GUI: Open-source 3D CAD/MCAD/CAx/CAE/PLM modeler.
      openscad # GUI: 3D parametric model compiler.
      openscad-unstable # GUI: Unstable version of OpenSCAD.
      */
      # End of CAD Software

      # 3D Modeling and Animation
      /*
      blender # GUI: 3D creation/animation/publishing system.
      blender-hip # GUI: Blender with HIP support for AMD GPUs.
      */
      # End of 3D Modeling and Animation

      # Virtualization Tools
      /*
      lazydocker # TUI: Terminal UI for Docker and Docker Compose.
      distrobox # CLI: Wrapper around Podman or Docker for creating containers.
      gnome-boxes # GUI: GNOME application for accessing virtual systems.
      junest # CLI: Arch Linux distribution that runs on top of another without root.
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
      /*
      bleachbit # GUI: System cleaner and disk space liberator.
      czkawka # GUI: App to remove unnecessary files.
      */
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
      libsForQt5.knights # GUI: Chess game for KDE.
      */
      # End of Games

      # Eye Candy
      /*
      cava # CLI: Console-based audio visualizer.
      cavalcade # GUI: Python wrapper for C.A.V.A. utility with a GUI.
      */
      # End of Eye Candy

      # System Information Fetchers
      /*
      onefetch # CLI: Displays Git repository summary.
      neofetch # CLI: Customizable system information script.
      cpufetch # CLI: Fetches CPU architecture information.
      ramfetch # CLI: Displays memory information.
      nur.repos.vanilla.fastfetch # CLI: Faster fork of Neofetch written in C.
      */
      # End of System Information Fetchers

      # Download Managers
      /*
      wget # CLI: Tool for retrieving files using HTTP, HTTPS, and FTP.
      wget2 # CLI: Successor to GNU Wget.
      curlFull # CLI: Command-line tool for transferring data with URL syntax.
      aria2 # CLI: Lightweight multi-protocol download utility.
      motrix # GUI: Feature-rich download manager.
      uget # GUI: Download manager using GTK and libcurl.
      ariang # WEB: Web frontend for Aria2.
      uget-integrator # Plugin: Integrates uGet with web browsers.
      */
      # End of Download Managers

      # Torrent Clients and Tools
      qbittorrent # GUI: Feature-rich BitTorrent client. For plugins: <https://github.com/qbittorrent/search-plugins>
      /*
      tribler # GUI: Decentralized P2P file sharing client.
      biglybt # GUI: BitTorrent client based on the Azureus that supports I2P darknet for privacy.
      bitcomet # GUI: Free BitTorrent download client.
      multiplex # GUI: Watch torrents with friends.
      btfs # CLI: BitTorrent filesystem based on FUSE.
      jesec-rtorrent # CLI: Ncurses client for libtorrent.
      transmission # CLI: Fast and easy BitTorrent client.
      transmission-gtk # GUI: GTK interface for Transmission.
      deluge-gtk # GUI: Lightweight, cross-platform BitTorrent client.
      webtorrent_desktop # GUI: Streaming torrent app.
      popcorntime # GUI: Streams movies and TV shows from torrents.
      miru # GUI: Streams anime torrents in real-time.
      flood # WEB: Modern web UI for torrent clients.
      */
      # End of Torrent Clients and Tools

      # YouTube/Spotify/SoundCloud Downloaders
      /*
      yt-dlp # CLI: Fork of youtube-dl with additional features.
      tartube-yt-dlp # GUI: GUI frontend for youtube-dl and yt-dlp.
      youtube-dl # CLI: Tool to download videos from YouTube and other sites (unmaintained).
      yt-dlg # GUI: Cross-platform GUI for youtube-dl.
      ytmdl # CLI: CLI tool to download music from YouTube.
      spotdl # CLI: Spotify downloader.
      scdl # CLI: SoundCloud downloader.
      */
      # End of YouTube/Spotify Downloaders

      # Networking Tools
      /*
      httrack # CLI: Offline browser and website mirroring utility.
      katana # CLI: Next-generation crawling and spidering framework.
      dnsrecon # CLI: DNS enumeration script.
      dig # CLI: DNS lookup utility.
      sniffnet # GUI: Cross-platform network traffic monitor.
      */
      # End of Networking Tools

      # Messaging and Chat Clients
      /*
      telegram-desktop # GUI: Official Telegram Desktop app.
      session-desktop # GUI: Onion routing based messenger.
      revolt-desktop # GUI: Open-source chat platform.
      keybase-gui # GUI: Keybase GUI client.
      slack # GUI: Desktop client for Slack.
      zulip # GUI: Desktop client for Zulip Chat.
      simplex-chat-desktop # GUI: Desktop app for SimpleX Chat.
      qtox # GUI: Qt Tox client.
      rocketchat-desktop # GUI: Desktop client for Rocket.Chat.
      wire-desktop # GUI: Secure messenger.
      */
      #- Discord
      #-- Discord Clients
      /*
      vesktop # GUI: Alternate Discord client by Vencord with built-in features.
      discord # GUI: Official Discord client.
      armcord # GUI: Lightweight Discord client.
      ripcord # GUI: Proprietary client for Discord and Slack.
      betterdiscordctl # CLI: Utility for managing BetterDiscord.
      cordless # TUI: Discord terminal client.
      */
      #-- End of Discord Clients
      #-- Discord Miscellaneous
      /*
      premid # CLI: Shows web activity as playing status on Discord.
      */
      #-- End of Discord Miscellaneous
      #- Matrix Clients
      element-desktop # GUI: Popular Matrix client.
      libsForQt5.neochat # GUI: KDE Matrix client.
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
      /*
      dino # GUI: Modern Jabber/XMPP client using GTK/Vala.
      */
      #- End of XMPP/Jabber Clients
      /*
      threema-desktop # GUI: Desktop client for Threema.
      gitter # GUI: Chat platform for developers (abandoned by upstream).
      zapzap # GUI: WhatsApp desktop application for Linux.
      signal-desktop # GUI: Private, secure messenger.
      keybase # CLI: Keybase command-line utility and service.
      */
      # End of Messaging and Chat Clients

      # Media Players and Tools
      #- Video Players
      /*
      mpv # CLI: Powerful media player.
      vlc # GUI: Versatile media player.
      */
      #- End of Video Players
      #- Image Viewers
      gthumb # GUI: Image browser and viewer for GNOME.
      eog # GUI: GNOME image viewer.
      pix # GUI: Image viewer from Linux Mint.
      pineapple-pictures # GUI: Lightweight image viewer.
      /*
      loupe # GUI: Simple image viewer written in GTK4 and Rust.
      xviewer # GUI: Image viewer from Linux Mint.
      oculante # GUI: Minimalistic cross-platform image viewer.
      feh # CLI: Lightweight image viewer.
      meh # GUI: Minimal image viewer using raw XLib.
      image-roll # GUI: GTK image viewer with basic image manipulation tools.
      libsForQt5.gwenview # GUI: KDE image viewer.
      nsxiv # GUI: Suckless X image viewer.
      nomacs # GUI: Qt-based image viewer.
      napari # GUI: Fast, interactive, multi-dimensional image viewer.
      digikam # GUI: Photo management program.
      shotwell # GUI: Photo organizer for GNOME.
      darktable # GUI: Virtual lighttable and darkroom for photographers.
      fim # CLI: Lightweight, customizable image viewer.
      emulsion # GUI: Fast and minimalistic image viewer.
      */
      #- End of Image Viewers
      #- Image Tools
      imagemagickBig # CLI: Suite for creating, editing, and converting images.
      #- End of Image Tools
      #- Audio Players
      audacious # GUI: Lightweight and versatile audio player.
      audacious-plugins # Plugin: Plugins for Audacious.
      /*
      amberol # GUI: Small and simple audio player.
      lollypop # GUI: Modern music player for GNOME.
      rhythmbox # GUI: Music player for GNOME.
      tauon # GUI: Music player with a futuristic interface.
      mpvc # CLI: MPC-like control interface for mpv.
      exaile # GUI: Music player with a simple interface.
      */
      /*
      libsForQt5.vvave # GUI: Multi-platform media player.
      */
      #- End of Audio Players
      #- Audio Controllers
      /*
      jamesdsp # GUI: Audio effect processor for PipeWire clients.
      easyeffects # GUI: Audio effects for PipeWire applications.
      */
      pavucontrol # GUI: PulseAudio volume control.
      # pasystray # Tray: PulseAudio system tray icon.
      #- End of Audio Controllers
      #- Media Tools
      ffmpeg-full # CLI: Complete solution for recording, converting, and streaming audio and video.
      /*
      mediainfo # CLI: Provides technical and tag information about media files.
      exiftool # CLI: Tool for reading, writing, and editing EXIF metadata.
      sox # CLI: Sample rate converter for audio.
      */
      #- End of Media Tools
      #- VLC Plugins
      /*
      vlc-bittorrent # Plugin: BitTorrent plugin for VLC.
      */
      #- End of VLC Plugins
      # End of Media Players and Tools

      # Entertainment
      /*
      spotify # GUI: Spotify web music player.
      nuclear # GUI: Music streaming app similar to Spotify.
      mov-cli # CLI: Browse and watch movies from the command-line.
      lrby # GUI: Browser and wallet for LBRY.
      popcorntime # GUI: Streams movies and TV shows from torrents.
      */
      # End of Entertainment

      # PipeWire Tools
      /*
      helvum # GUI: GTK patchbay for PipeWire.
      qpwgraph # GUI: Qt graph manager for PipeWire, similar to QjackCtl.
      */
      # End of PipeWire Tools

      # Compression and Archiving Tools
      mate.engrampa # GUI: Archive manager for MATE.
      lxqt.lxqt-archiver # GUI: Archive tool for LXQt.
      libsForQt5.ark # GUI: KDE archive manager.
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
      # End of Compression and Archiving Tools

      # Document Viewers
      evince # GUI: GNOME document viewer.
      mate.atril # GUI: Multi-page document viewer for MATE.
      libsForQt5.okular # GUI: KDE document viewer.
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
      libsForQt5.dolphin # GUI: KDE file manager.
      libsForQt5.dolphin-plugins # Plugin: Plugins for Dolphin.
      krusader # GUI: Twin-panel file manager for KDE.
      spaceFM # GUI: Multi-panel tabbed file manager.
      pcmanfm # GUI: File manager with GTK interface.
      */
      # End of File Managers

      # Terminal Emulators
      /*
      kitty # GUI: GPU-accelerated terminal emulator.
      alacritty # GUI: GPU-accelerated terminal emulator.
      wezterm # GUI: GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust.
      warp-terminal # GUI: The modern intelligent terminal.
      xfce.xfce4-terminal # GUI: Modern terminal emulator for the Xfce desktop.
      mate.mate-terminal # GUI: Terminal emulator for MATE.
      lxterminal # GUI: Standard terminal emulator of LXDE.
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
      obs-studio-plugins.obs-vaapi # Plugin: VAAPI support for OBS Studio.
      obs-studio-plugins.obs-vkcapture # Plugin: Vulkan/OpenGL game capture for OBS Studio.
      obs-studio-plugins.obs-gstreamer # Plugin: GStreamer plugin for OBS Studio.
      obs-studio-plugins.input-overlay # Plugin: Shows keyboard, gamepad, and mouse input on stream.
      obs-studio-plugins.obs-pipewire-audio-capture # Plugin: PipeWire audio capture for OBS Studio.
      obs-studio-plugins.obs-nvfbc # Plugin: NVIDIA FBC API plugin for OBS Studio.
      gpu-screen-recorder # CLI: GPU-accelerated screen recorder.
      gpu-screen-recorder-gtk # GUI: GUI for gpu-screen-recorder.
      */
      #- End of OBS Studio
      /*
      peek # GUI: Simple animated GIF screen recorder.
      vhs # CLI: Generates terminal GIFs.
      */
      #- Asciinema
      /*
      asciinema # CLI: Terminal session recorder.
      asciinema-agg # CLI: Generates animated GIFs from asciinema recordings.
      asciinema-scenario # CLI: Creates asciinema videos from a text file.
      */
      #- End of Asciinema
      # End of Screen and Audio Recorders

      # Audio and Video Editors
      /*
      #- Audio Editors
      audacity # GUI: Sound editor with a graphical interface.
      ardour # GUI: Multi-track hard disk recording software.
      #- End of Audio Editors
      #- Video Editors
      losslesscut-bin # GUI: Lossless video/audio editor.
      openshot-qt # GUI: Free, open-source video editor.
      libsForQt5.kdenlive # GUI: KDE video editor.
      lightworks # GUI: Professional non-linear video editor.
      flowblade # GUI: Multitrack non-linear video editor.
      olive-editor # GUI: Professional open-source NLE video editor.
      shotcut # GUI: Cross-platform video editor.
      pitivi # GUI: Non-linear video editor using GStreamer.
      video-trimmer # GUI: Trims videos quickly.
      #- End of Video Editors
      */
      #- Image Editors
      /*
      krita # GUI: Free and open-source painting application.
      gimp-with-plugins # GUI: GNU Image Manipulation Program with plugin support.
      gimpPlugins.gap # Plugin: GIMP Animation Package.
      gimpPlugins.bimp # Plugin: Batch Image Manipulation Plugin for GIMP.
      gimpPlugins.fourier # Plugin: Fourier transform plugin for GIMP.
      gimpPlugins.gimplensfun # Plugin: Lens distortion correction plugin for GIMP.
      gimpPlugins.farbfeld # Plugin: Farbfeld image format plugin for GIMP.
      #- End of Image Editors
      #- Vector Graphics and Other Editors
      inkscape-with-extensions # GUI: Vector graphics editor with extension support.
      inkscape-extensions.hexmap # Extension: Creates hex grids and brick patterns in Inkscape.
      inkscape-extensions.applytransforms # Extension: Removes matrix transforms in Inkscape.
      #- End of Vector Graphics and Other Editors
      */
      # End of Audio and Video Editors

      # Desktop Customization Tools
      /*
      flashfocus # Daemon: Adds focus animations to tiling window managers.
      #- Wallpaper Managers
      nitrogen # GUI: Wallpaper browser and setter for X11.
      hyprpaper # GUI: Wayland wallpaper utility.
      swww # CLI: Animated wallpaper daemon for Wayland.
      #- End of Wallpaper Managers
      themix-gui # GUI: Theme designer with plugin support.
      lxappearance # GUI: Configures themes and fonts for GTK applications.
      themechanger # GUI: Theme changing utility.
      nwg-look # GUI: Nwg-look is a GTK3 settings editor, designed to work properly in wlroots-based Wayland environment.
      wpgtk # GUI: Wallpaper and colorscheme generator and manager.
      libsForQt5.qt5ct # GUI: Qt5 configuration tool.
      libsForQt5.qtstyleplugins # Plugin: Additional style plugins for Qt5.
      libsForQt5.qtstyleplugin-kvantum # GUI: Qt5 theme engine and configuration tool.
      */
      # End of Desktop Customization Tools

      # Network Management
      /*
      networkmanagerapplet # GUI/Tray: NetworkManager applet for GNOME.
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
      picom-pijulius # Daemon: Picom fork with extensive animation support.
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
      /*
      flameshot # GUI: Feature-rich screenshot tool.
      scrot # CLI: Command-line screenshot utility.
      maim # CLI: Command-line screenshot utility.
      shotgun # CLI: Minimal X screenshot utility.
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
      libsForQt5.kalzium # GUI: Periodic Table of Elements.
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
      libsForQt5.discover # GUI: KDE software center (supports Flathub).
      */
      # End of Software Centers

      # Antivirus Software
      /*
      clamav # CLI: Antivirus engine.
      */
      # End of Antivirus Software

      # Media Converters
      /*
      handbrake # GUI: Video converter and DVD ripper.
      rawtherapee # GUI: RAW image converter and photo editor.
      */
      # End of Media Converters

      # Calculators
      /*
      qalculate-gtk # GUI: Advanced desktop calculator.
      galculator # GUI: GTK algebraic and RPN calculator.
      speedcrunch # GUI: Fast calculator for power users.
      */
      # End of Calculators

      # Scientific Software
      /*
      mathematica-cuda # GUI: Wolfram Mathematica with CUDA support.
      octaveFull # GUI: Scientific programming language.
      scilab-bin # GUI: Numerical computation software (Matlab-like).
      gnuplot # GUI: Command-line graphing utility.
      */
      # End of Scientific Software

      # Security Tools
      /*
      veracrypt # GUI: On-the-fly encryption software.
      libsForQt5.kgpg # GUI: KDE interface for GnuPG.
      gnome-obfuscate # GUI: Censors private information in images.
      */
      # End of Security Tools

      # Mathematics Software
      /*
      geogebra # GUI: Dynamic mathematics software.
      */
      # End of Mathematics Software

      # SQL Clients
      # mysql-workbench # GUI: Visual MySQL database tool.
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
      /*
      gcolor2 # GUI: Simple GTK color selector.
      gcolor3 # GUI: Color selector.
      gpick # GUI: Advanced color picker.
      libsForQt5.kcolorchooser # GUI: KDE color chooser.
      */
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
      webp-pixbuf-loader # Lib: WebP thumbnail support.
      poppler # Lib: PDF thumbnail support.
      ffmpegthumbnailer # Lib: Video thumbnail support.
      gnome-epub-thumbnailer # Lib: EPub and MOBI thumbnail support.
      /*
      libgsf # Lib: ODF thumbnail support.
      f3d # Lib: 3D file thumbnail support (glTF, stl, step, ply, obj, fbx).
      mcomix # Lib: Comic book thumbnail support (cbz, cbr).
      */
      # End of Tumbler Thumbnailers

      # VPN Clients
      /*
      protonvpn-cli_2 # CLI: ProtonVPN command-line client using OpenVPN.
      protonvpn-gui # GUI: ProtonVPN client.
      protonvpn-cli # CLI: ProtonVPN command-line client.
      */
      # End of VPN Clients

      # Miscellaneous Tools and Applications
      /*
      gallery-dl # CLI: Downloads image galleries from various websites.
      hydrus # GUI: Image tagging and searching system.
      sonic-visualiser # GUI: Music audio analysis tool.
      qtchan # GUI: 4chan browser.
      gnome-podcasts # GUI: Podcast client for GNOME.
      figma-linux # GUI: Unofficial Figma desktop app for Linux.
      mousai # GUI: Music identification tool.
      d-spy # GUI: D-Bus exploration tool.
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
      openssl # Lib+CLI: Cryptographic library and tools.
      */
      # End of Libraries

      # Essential System Utilities
      nvtopPackages.full # CLI: GPU task monitor for AMD, Intel, and NVIDIA.
      i3lock-fancy-rapid # GUI: Fast and customizable lockscreen for i3wm.
      linux-wifi-hotspot # GUI: Creates Wi-Fi hotspots.
      /*
      nvitop # CLI: NVIDIA GPU process viewer.
      resources # GUI: System resource monitor.
      mission-center # GUI: Monitor your CPU, Memory, Disk, Network and GPU usage
      gnome-usage # GUI: System resource usage viewer.
      gnome-disk-utility # GUI: Disk management tool.
      wgetpaste # CLI: Command-line interface to pastebin services.
      #- https://github.com/swaywm/sway/wiki/GTK-3-settings-on-Wayland#xsettings
      #- https://wiki.hyprland.org/FAQ/#gtk-settings-no-work--whatever
      xsettingsd # CLI: Provides settings to X11 applications.
      xfce.xfce4-taskmanager # GUI: XFCE task manager.
      tree # CLI: Displays directory structure as a tree.
      smartmontools # CLI: Hard drive health monitoring tools.
      nvme-cli # CLI: NVM-Express user space tools.
      lm_sensors # CLI: Hardware sensor reading tools.
      */
      #- jq - JSON Processor
      /*
      jq # CLI: Command-line JSON processor.
      jqp # CLI: TUI playground for jq.
      ijq # CLI: Interactive wrapper for jq.
      */
      #- End of jq
      #- Filesystem Tools
      /*
      hdparm # CLI: Manipulates ATA/SATA drive parameters.
      btrfs-progs # CLI: Utilities for the Btrfs filesystem.
      compsize # CLI: Finds compression type/ratio on Btrfs files.
      exfatprogs # CLI: exFAT filesystem utilities.
      e2fsprogs # CLI: Tools for ext2/ext3/ext4 filesystems.
      duff # CLI: Finds duplicate files.
      dua # CLI: Learns about disk usage of directories.
      /*
      zenith-nvidia # CLI: System monitor with zoom-able charts and NVIDIA GPU usage.
      filezilla # GUI: FTP, FTPS, and SFTP client.
      util-linux # CLI: Set of system utilities.
      etcher # GUI: Flashes OS images to SD cards and USB drives.
      glances # CLI: Curses-based system monitor.
      gpu-viewer # GUI: Frontend for glxinfo, vulkaninfo, clinfo, and es2_info.
      libva-utils # CLI: Utilities and examples for VA-API.
      curtail # GUI: Image compressor.
      hamster # GUI: Time tracking application.
      arandr # GUI: Visual frontend for XRandR.
      ngrok # CLI: Exposes local web servers to the internet.
      glxinfo # CLI: OpenGL test utilities.
      inxi # CLI: System information tool.
      treefmt # CLI: Formats code trees.
      cpupower-gui # GUI: GUI for cpupower.
      zenmonitor # GUI: Monitoring software for AMD Zen CPUs.
      doge # CLI: Displays Doge in the terminal.
      terminal-parrot # CLI: Shows animated party parrot in the terminal.
      kmon # CLI: Linux Kernel Manager and Activity Monitor.
      trashy # CLI: Alternative to 'rm' and 'trash-cli'.
      shadowfox # CLI: Universal dark theme for Firefox.
      baobab # GUI: Disk usage analyzer for GNOME.
      wmname # CLI: Prints/sets window manager name.
      ocs-url # CLI: Open Collaboration System for store websites.
      traceroute # CLI: Network route tracking tool.
      psensor # GUI: Hardware temperature monitor.
      stress # CLI: Workload generator for POSIX systems.
      s-tui # CLI: Stress Terminal UI monitoring tool.
      libnotify # CLI: Sends desktop notifications.
      gping # CLI: Graphical ping utility.
      cpu-x # GUI: CPU, motherboard, and system information tool.
      dua # CLI: Disk usage analyzer.
      vnstat # CLI: Network statistics utility.
      nload # CLI: Network traffic and bandwidth monitor.
      alsa-utils # CLI: ALSA utilities.
      hwinfo # CLI: Hardware detection tool.
      cpuid # CLI: Dumps x86 CPUID information.
      pciutils # CLI: Tools for PCI devices.
      usbutils # CLI: Tools for USB devices.
      pydf # CLI: Colorized 'df' clone.
      tmux # CLI: Terminal multiplexer.
      tmate # CLI: Instant terminal sharing.
      krename # GUI: Batch renamer for KDE.
      eaglemode # GUI: Zoomable user interface.
      mat2 # CLI: Metadata removal tool.
      wayland-utils # CLI: Wayland utilities (wayland-info).
      wdisplays # GUI: Graphical application for configuring Wayland displays.
      */
      # End of Filesystem Tools
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
      #- Gamepad Controllers
      /*
      antimicrox # GUI: Maps keyboard and mouse to gamepads.
      gamepad-tool # GUI: Creates/modifies gamepad mappings for SDL2 games.
      xboxdrv # Driver: Xbox/Xbox 360 gamepad driver.
      */
      # End of Gamepad Controllers
      #- Wine
      /*
      wine-wayland # CLI: Wine with experimental Wayland support.
      wine-staging # CLI: Wine with staging patches.
      winetricks # GUI: Installs DLLs and components for Wine.
      bottles # GUI: Wine prefix manager.
      #- Proton
      protontricks # CLI: Runs Winetricks commands for Proton games.
      protonup-qt # GUI: Manages Proton-GE and Luxtorpeda for Steam and Wine-GE for Lutris.
      #- Misc Gaming Tools
      lutris # GUI: Open-source gaming platform for Linux.
      */
      # End of Gaming and Windows Compatibility

      # Experimental Nix Tools
      /*
      nix-software-center # GUI: GTK4 software center for Nix packages.
      nixos-conf-editor # GUI: Libadwaita app for editing NixOS configurations.
      nix-editor # CLI: Command-line tool for modifying NixOS configuration values.
      snow # CLI: Command-line wrapper for Nix.
      */
      # End of Experimental Nix Tools
    ];
  };
}
