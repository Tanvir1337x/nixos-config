# Rip Out Default Packages
{lib, ...}: {
  # Get rid of default packages for minimalism
  environment.defaultPackages = lib.mkForce [];

  documentation = {
    enable = true;
    nixos.enable = true;
    man.enable = true;
    doc.enable = true;
    info.enable = true;
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
