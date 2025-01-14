# Root/System Packages Configuration
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # USER.hblock # cli: shell script for blocking ads, malware and tracking domains
    gparted # GUI: partition manager for gnome.
    libnotify # LIBRARY/CLI: Sends desktop notifications.
    libsecret # LIBRARY: Library for storing and retrieving passwords and other secrets.

    firmware-updater # GUI: Firmware Updater for Linux.
    firmware-manager # GUI: Graphical frontend for firmware management.
    gnome-firmware # GUI: Tool for installing firmware on devices.

    # <https://wiki.nixos.org/wiki/Fish#System_wide>
    /*
    fishPlugins.wakatime-fish # PLUGIN: wakatime fish plugin.
    fishPlugins.colored-man-pages # PLUGIN: Fish shell plugin to colorize man pages.
    fishPlugins.forgit # PLUGIN: A utility tool powered by fzf for using git interactively.
    fishPlugins.plugin-git # PLUGIN: Git plugin for fish (similar to oh-my-zsh git).
    */
    fishPlugins.autopair # PLUGIN: Auto-complete matching pairs in the Fish command line.
    fishPlugins.puffer # PLUGIN: Text Expansions for Fish.
  ];
}
