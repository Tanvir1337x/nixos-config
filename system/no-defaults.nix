# Rip Out Default System Packages
{lib, ...}: {
  # Get rid of default packages for minimalism
  environment.defaultPackages = lib.mkForce [];

  programs.nano.enable = false;

  documentation = {
    enable = false;
    nixos.enable = false;
    man.enable = false;
    doc.enable = false;
    info.enable = false;
    dev.enable = false;
  };

  xdg = {
    icons.enable = true;
    mime.enable = true;
    sounds.enable = false;
    menus.enable = true;
    autostart.enable = true;
    # portal.enable = true;
    terminal-exec.enable = true;
  };
}
