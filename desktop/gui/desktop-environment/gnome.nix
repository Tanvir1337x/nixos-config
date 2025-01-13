# Gnome Configuration
#- <https://wiki.nixos.org/wiki/GNOME>
{pkgs, ...}: {
  services.xserver = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Simply using gdm/login there won’t work because GNOME keyring
  # is supposed to be unlocked as part of gdm-password service
  # <https://discourse.nixos.org/t/login-keyring-did-not-get-unlocked-hyprland/40869/12?u=tanvir1337x>
  # security.pam.services.gdm.enableGnomeKeyring = true; # Load gnome-keyring at startup
  security.pam.services.gdm-password.enableGnomeKeyring = true; # Load gnome-keyring at login
  # security.pam.services.greetd.enableGnomeKeyring = true; # Load gnome-keyring at login

  services = {
    # Browser integration
    gnome.gnome-browser-connector.enable = true;

    # Trash folder in Gnome apps
    # gvfs.enable = true;

    udev.packages = with pkgs; [
      gnome.gnome-settings-daemon
    ];
  };

  # System packages
  environment.systemPackages = with pkgs;
  with gnome;
  with gnomeExtensions; [
    # Essential
    gnome-tweaks
    gnome-settings-daemon

    # Extensions
    gsconnect # conflicts with kdeconnect, either one is fine or stop kdeconnect
    clipman
    user-avatar-in-quick-settings
    wifi-qrcode
    wayland-or-x11
    material-shell
    appindicator
    just-perfection
    uptime-indicator
    display-scale-switcher
    privacy-settings-menu
    blur-my-shell
  ];

  # Excluding unwanted packages
  environment.gnome.excludePackages = with pkgs.gnome; [
    gnome-system-monitor
    gnome-text-editor
    gnome-tour
    gnome-connections
    gnome-screenshot
    cheese
    epiphany
    yelp
    simple-scan
    gnome-weather
    gnome-contacts
    gnome-clocks
    gnome-maps
    gnome-calculator
  ];
}
