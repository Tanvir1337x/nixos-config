# Font Configuration
#- <https://wiki.nixos.org/wiki/Fonts>
{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;
    # Issue: <https://wiki.nixos.org/wiki/Fonts#Flatpak_applications_can.27t_find_system_fonts>
    fontDir.enable = true;

    fontconfig = {
      enable = true;
      antialias = true;
      includeUserConf = true;
      allowBitmaps = false;
      allowType1 = false; # Poor rendering

      subpixel = {
        # rgba = "rgb";
        lcdfilter = "default";
      };

      hinting = {
        enable = true;
        autohint = false;
        style = "full";
      };
    };

    packages = with pkgs; [
      # Noto Fonts Family for wide language support
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji

      # Fira Code for programming with ligatures
      fira-code

      # monaspace <https://monaspace.githubnext.com/>

      /*
      inconsolata
      mononoki
      iosevka
      cascadia-code
      office-code-pro
      anonymousPro
      recursive
      hasklig
      jetbrains-mono
      monoid
      victor-mono
      fantasque-sans-mono
      */

      # <https://b612-font.com>
      # B612 font for experimental use, optimized for cockpit screens
      # b612

      # monocraft # Programming font based on the typeface used in Minecraft
      # miracode # Sharp, readable, vector-y version of Monocraft
      # minecraftia # Cool Minecraft font

      # Icon/Symbol support
      fira-code-symbols
      material-icons
      font-awesome
      (nerdfonts.override {
        fonts = [
          "Noto"
          "FiraCode"
          /*
          "Inconsolata"
          "Iosevka"
          "JetBrainsMono"
          "Monoid"
          "Mononoki"
          "Meslo" # Recommended by ohmyposh <https://ohmyposh.dev/docs/installation/fonts>
          */
        ];
      })

      # Misc
      /*
      ubuntu_font_family
      terminus_font
      source-han-sans
      */
    ];
  };
}
