# Root/System Packages Configuration
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # USER.hblock # cli: shell script for blocking ads, malware and tracking domains
    gparted # GUI: partition manager for gnome.

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
