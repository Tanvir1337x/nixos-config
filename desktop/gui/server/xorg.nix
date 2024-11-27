# Xorg/X11 Configuration
#- <https://wiki.nixos.org/wiki/Xorg>
{pkgs, ...}: {
  services = {
    libinput = {
      enable = true;
      mouse = {
        disableWhileTyping = true;
        accelProfile = "adaptive";
        naturalScrolling = false;
      };

      touchpad = {
        disableWhileTyping = true;
        accelProfile = "adaptive";
        naturalScrolling = true;
        horizontalScrolling = true;
        tapping = true;
      };
    };

    xserver = {
      enable = true;
      dpi = 100;
      autorun = true;
      xkb.layout = "us";
      desktopManager.xterm.enable = false;
      excludePackages = [pkgs.xterm];

      # Xorg system-wide without a Display Manager
      # <https://wiki.nixos.org/wiki/Using_X_without_a_Display_Manager#Setting_up_Xorg_system-wide_but_without_a_Display_Manager>
      displayManager.startx.enable = false; # Set it to true to disable Display Manager and enable TTY login prompt
    };

    displayManager = {
      defaultSession = "none+awesome";
      autoLogin = {
        enable = true;
        user = "user";
      };
    };
  };
}
