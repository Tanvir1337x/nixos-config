# MPV Overlay Configuration
# <https://wiki.nixos.org/wiki/MPV>
# Find more:
# <https://github.com/mpv-player/mpv/wiki/User-Scripts>
# <https://github.com/stax76/awesome-mpv>
{pkgs, ...}: {
  nixpkgs.overlays = [
    (super: {
      mpv = super.mpv-unwrapped.override {
        lua = pkgs.luajit;
        vapoursynthSupport = true;
        youtubeSupport = true;
        sixelSupport = true;
      };
    })
  ];
}
