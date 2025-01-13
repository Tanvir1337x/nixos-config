# Hyprland (Wayland Compositor) Configuration
_: {
  programs.hyprland = {
    enable = true;
    nvidiaPatches = true; # Required for screenshot tools to work

    xwayland = {
      enable = true;
      # <https://wiki.archlinux.org/title/HiDPI>
    };
  };

  # <https://discourse.nixos.org/t/login-keyring-did-not-get-unlocked-hyprland/40869>
  # security.pam.services.gdm-password.enableGnomeKeyring = true; # Load gnome-keyring at login
}
