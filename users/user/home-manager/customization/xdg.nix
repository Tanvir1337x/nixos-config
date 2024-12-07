_: let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.user = {
    pkgs,
    config,
    ...
  }: {
    xdg = {
      enable = true;
      # configHome = "~/.config";
      # cacheHome = "~/.cache";
      # dataHome = "~/.local/share";

      mime.enable = true;
      mimeApps.enable = true;

      # cat /home/user/.config/mimeapps.list
      mimeApps = {
        defaultApplications = {
          # folders
          "inode/directory" = "thunar.desktop";
          "x-directory/normal" = "thunar.desktop";
          "x-directory/gnome-default-handler" = "thunar.desktop";
          "x-directory/normal-gnome-default-handler" = "thunar.desktop";

          # web
          "x-scheme-handler/http" = "firefox-esr.desktop";
          "x-scheme-handler/https" = "firefox-esr.desktop";
          "x-scheme-handler/ftp" = "firefox-esr.desktop";

          # mail
          "x-scheme-handler/mailto" = "thunderbird.desktop";

          # images
          "image/jpeg" = "org.gnome.eog.desktop";
          "image/png" = "org.gnome.eog.desktop";
          "image/avif" = "org.gnome.eog.desktop";
          "image/gif" = "org.gnome.eog.desktop";
          "image/webp" = "org.gnome.eog.desktop";
          "image/bmp" = "org.gnome.eog.desktop";
          "image/svg+xml" = "org.gnome.eog.desktop";
          "image/vnd.microsoft.icon" = "org.gnome.eog.desktop";
          "image/x-bmp" = "org.gnome.eog.desktop";
          "image/x-MS-bmp" = "org.gnome.eog.desktop";
          "image/x-portable-bitmap" = "org.gnome.eog.desktop";
          "image/x-portable-graymap" = "org.gnome.eog.desktop";
          "image/x-portable-pixmap" = "org.gnome.eog.desktop";
          "image/x-xbitmap" = "org.gnome.eog.desktop";
          "image/x-xpixmap" = "org.gnome.eog.desktop";
          "image/x-xwindowdump" = "org.gnome.eog.desktop";
          "image/tiff" = "org.gnome.eog.desktop";
          "image/x-tga" = "org.gnome.eog.desktop";
          "image/x-pcx" = "org.gnome.eog.desktop";
          "image/x-portable-anymap" = "org.gnome.eog.desktop";
          "image/x-ico" = "org.gnome.eog.desktop";
          "image/x-icon" = "org.gnome.eog.desktop";

          # videos
          "video/mp4" = "mpv.desktop";
          "video/webm" = "mpv.desktop";
          "video/x-matroska" = "mpv.desktop";
          "video/x-msvideo" = "mpv.desktop";
          "video/x-ms-wmv" = "mpv.desktop";
          "video/x-flv" = "mpv.desktop";
          "video/x-m4v" = "mpv.desktop";
          "video/x-mpeg" = "mpv.desktop";
          "video/x-ms-asf" = "mpv.desktop";
          "video/x-ms-wm" = "mpv.desktop";
          "video/x-ms-wmx" = "mpv.desktop";
          "video/x-ms-wvx" = "mpv.desktop";
          "video/x-sgi-movie" = "mpv.desktop";
          "video/x-theora" = "mpv.desktop";
          "video/x-ogm+ogg" = "mpv.desktop";
          "video/x-ogm+ogv" = "mpv.desktop";
          "video/x-ogm+ogm" = "mpv.desktop";
          "video/x-ogm+ogx" = "mpv.desktop";
          "video/quicktime" = "mpv.desktop";
          "video/x-f4v" = "mpv.desktop";
          "video/x-mng" = "mpv.desktop";

          # audio
          "audio/mpeg" = "audacious.desktop";
          "audio/x-wav" = "audacious.desktop";
          "audio/x-flac" = "audacious.desktop";
          "audio/x-vorbis+ogg" = "audacious.desktop";
          "audio/x-ms-wma" = "audacious.desktop";
          "audio/x-ms-wax" = "audacious.desktop";
          "audio/x-ms-asx" = "audacious.desktop";
          "audio/x-musepack" = "audacious.desktop";
          "audio/x-mod" = "audacious.desktop";
          "audio/x-s3m" = "audacious.desktop";
          "audio/x-it" = "audacious.desktop";
          "audio/x-umx" = "audacious.desktop";
          "audio/x-midi" = "audacious.desktop";
          "audio/x-ape" = "audacious.desktop";
          "audio/x-wavpack" = "audacious.desktop";
          "audio/x-aac" = "audacious.desktop";
          "audio/mp4" = "audacious.desktop";
          "audio/x-m4a" = "audacious.desktop";
          "audio/x-m4b" = "audacious.desktop";
          "audio/x-m4p" = "audacious.desktop";
          "audio/x-m4r" = "audacious.desktop";
          "audio/x-m4v" = "audacious.desktop";
          "audio/x-mp3" = "audacious.desktop";
          "audio/x-mp4" = "audacious.desktop";
          "audio/x-mpc" = "audacious.desktop";
          "audio/x-ogg" = "audacious.desktop";
          "audio/x-opus" = "audacious.desktop";
          "audio/x-sid" = "audacious.desktop";
          "audio/x-xm" = "audacious.desktop";
          "audio/x-vorbis" = "audacious.desktop";
          "audio/ogg" = "audacious.desktop";
          "audio/webm" = "audacious.desktop";
          "audio/aac" = "audacious.desktop";
          "audio/midi" = "audacious.desktop";
          "audio/x-aiff" = "audacious.desktop";
          "audio/basic" = "audacious.desktop";
          "audio/m4a" = "audacious.desktop";
          "audio/m4b" = "audacious.desktop";
          "audio/m4p" = "audacious.desktop";
          "audio/m4r" = "audacious.desktop";
          "audio/m4v" = "audacious.desktop";
          "audio/mp3" = "audacious.desktop";
          "audio/opus" = "audacious.desktop";
          "audio/wav" = "audacious.desktop";
          "audio/wave" = "audacious.desktop";
          "audio/x-pn-wav" = "audacious.desktop";
          "audio/x-realaudio" = "audacious.desktop";
          "audio/x-scpls" = "audacious.desktop";

          # keepassxc
          "application/x-keepass2" = "keepassxc.desktop";

          # torrent
          "application/x-bittorrent" = "qbittorrent.desktop";

          # ebook, pdf, epub and alike documents
          "application/pdf" = "atril.desktop";
          "application/epub+zip" = "okular.desktop";
          "application/x-mobipocket-ebook" = "calibre.desktop";

          # archive
          "application/x-7z-compressed" = "org.kde.ark.desktop";
          "application/x-bzip" = "org.kde.ark.desktop";
          "application/x-bzip2" = "org.kde.ark.desktop";
          "application/x-gzip" = "org.kde.ark.desktop";
          "application/x-lzma" = "org.kde.ark.desktop";
          "application/x-lzma-compressed-tar" = "org.kde.ark.desktop";
          "application/x-rar" = "org.kde.ark.desktop";
          "application/x-tar" = "org.kde.ark.desktop";
          "application/x-xz" = "org.kde.ark.desktop";
          "application/zip" = "org.kde.ark.desktop";
          "application/x-zip" = "org.kde.ark.desktop";
          "application/x-zip-compressed" = "org.kde.ark.desktop";
          "application/x-zip-compressed-tar" = "org.kde.ark.desktop";
          "application/x-compressed-tar" = "org.kde.ark.desktop";
          "application/x-tarz" = "org.kde.ark.desktop";
          "application/x-stuffit" = "org.kde.ark.desktop";
          "application/x-stuffitx" = "org.kde.ark.desktop";
          "application/x-ace" = "org.kde.ark.desktop";
          "application/x-arj" = "org.kde.ark.desktop";
          "application/x-cpio" = "org.kde.ark.desktop";
          "application/x-deb" = "org.kde.ark.desktop";
          "application/x-gtar" = "org.kde.ark.desktop";
          "application/x-rpm" = "org.kde.ark.desktop";
          "application/x-iso9660-image" = "org.kde.ark.desktop";
          "application/x-nrg" = "org.kde.ark.desktop";
          "application/x-cd-image" = "org.kde.ark.desktop";
          "application/x-compress" = "org.kde.ark.desktop";
          "application/x-lha" = "org.kde.ark.desktop";
          "application/x-lhz" = "org.kde.ark.desktop";
          "application/x-lzx" = "org.kde.ark.desktop";
          "application/x-ace-compressed" = "org.kde.ark.desktop";
          "application/x-arc" = "org.kde.ark.desktop";
          "application/x-arj-compressed" = "org.kde.ark.desktop";
          "application/x-b1" = "org.kde.ark.desktop";
          "application/x-b1-compressed" = "org.kde.ark.desktop";
          "application/x-bzip-compressed-tar" = "org.kde.ark.desktop";
          "application/x-bzip2-compressed-tar" = "org.kde.ark.desktop";
          "application/x-cabinet" = "org.kde.ark.desktop";
          "application/x-debian-package" = "org.kde.ark.desktop";
          "application/x-gtar-compressed" = "org.kde.ark.desktop";
          "application/x-gtarz" = "org.kde.ark.desktop";

          # text
          "text/plain" = "code.desktop";
          "text/markdown" = "code.desktop";
          "text/html" = "code.desktop";
          "text/xml" = "code.desktop";
          "text/css" = "code.desktop";
          "text/x-c" = "code.desktop";
          "text/x-c++" = "code.desktop";
          "text/x-csrc" = "code.desktop";
          "text/x-c++src" = "code.desktop";
          "text/x-chdr" = "code.desktop";
          "text/x-c++hdr" = "code.desktop";
          "text/x-cmake" = "code.desktop";
          "text/x-csharp" = "code.desktop";
          "text/x-diff" = "code.desktop";
          "text/x-go" = "code.desktop";
          "text/x-haskell" = "code.desktop";
          "text/x-java" = "code.desktop";
          "text/x-javascript" = "code.desktop";
          "text/x-lua" = "code.desktop";
          "text/x-makefile" = "code.desktop";
          "text/x-objective-c" = "code.desktop";
          "text/x-objective-c++" = "code.desktop";
          "text/x-pascal" = "code.desktop";
          "text/x-python" = "code.desktop";
          "text/x-rust" = "code.desktop";
          "text/x-scala" = "code.desktop";
          "text/x-shellscript" = "code.desktop";
          "text/x-sql" = "code.desktop";
          "text/x-tcl" = "code.desktop";
          "text/x-tex" = "code.desktop";
          "text/x-vala" = "code.desktop";
          "text/x-yaml" = "code.desktop";
          "text/x-ada" = "code.desktop";
          "text/x-asm" = "code.desktop";
          "text/x-awk" = "code.desktop";
          "text/x-caml" = "code.desktop";
          "text/x-clojure" = "code.desktop";
          "text/x-coffeescript" = "code.desktop";
          "text/x-d" = "code.desktop";
          "text/x-dtd" = "code.desktop";
          "text/x-erlang" = "code.desktop";
          "text/x-fortran" = "code.desktop";
          "text/x-genie" = "code.desktop";
          "text/x-groovy" = "code.desktop";
          "text/x-idl" = "code.desktop";
          "text/x-ini" = "code.desktop";
          "text/x-kotlin" = "code.desktop";
          "text/x-lisp" = "code.desktop";
          "text/x-toml" = "code.desktop";
        };
      };

      portal = {
        enable = true;
        # <https://github.com/NixOS/nixpkgs/issues/160923>
        xdgOpenUsePortal = true;
        extraPortals = with pkgs; [xdg-desktop-portal-gtk];
        # <https://github.com/flatpak/xdg-desktop-portal/blob/1.18.1/doc/portals.conf.rst.in>
        # Keep the behaviour in < 1.17, which uses the first
        # portal implementation found in lexicographical order
        config.common.default = "*";
      };

      userDirs = {
        enable = true;
        createDirectories = true;

        download = "${config.home.homeDirectory}/downloads";

        # music = "${config.home.homeDirectory}/media/musics";
        pictures = "${config.home.homeDirectory}/media/pictures";
        # videos = "${config.home.homeDirectory}/media/videos";

        # Don't need these
        music = null;
        videos = null;
        desktop = null;
        documents = null;
        publicShare = null;
        templates = null;

        extraConfig = {
          XDG_MEDIA_DIR = "${config.home.homeDirectory}/media";
          XDG_SCREENSHOT_DIR = "${config.home.homeDirectory}/media/pictures/screenshots";
          XDG_WALLPAPER_DIR = "${config.home.homeDirectory}/media/pictures/wallpapers";
          XDG_TORRENT_DIR = "${config.home.homeDirectory}/downloads/torrents";
        };
      };
    };
  };
}
