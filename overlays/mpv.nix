# MPV Overlay Configuration
# <https://wiki.nixos.org/wiki/MPV>
# Find more:
# <https://github.com/mpv-player/mpv/wiki/User-Scripts>
# <https://github.com/stax76/awesome-mpv>
_: {
  nixpkgs.overlays = [
    /*
    (super: {
      mpv = super.mpv-unwrapped.override {
        vapoursynthSupport = true;
        youtubeSupport = true;
      };
    })
    */
  ];
}
