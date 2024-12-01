# Root/System Packages Configuration
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # USER.hblock # cli: shell script for blocking ads, malware and tracking domains
    gparted # gui: partition manager for gnome

    # <https://wiki.nixos.org/wiki/Fish#System_wide>
    # fishPlugins.wakatime-fish # plugin: wakatime fish plugin
    # fishPlugins.colored-man-pages # plugin: Fish shell plugin to colorize man pages
    # fishPlugins.forgit # plugin: A utility tool powered by fzf for using git interactively
    fishPlugins.autopair # plugin: Auto-complete matching pairs in the Fish command line
    # fishPlugins.plugin-git # plugin: Git plugin for fish (similar to oh-my-zsh git)
    fishPlugins.puffer # plugin: Text Expansions for Fish
  ];
}
