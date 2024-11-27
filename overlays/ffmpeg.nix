# FFmpeg Overlay Configuration
_: {
  nixpkgs.overlays = [
    (_self: super: {
      # <https://nixos.wiki/wiki/CCache#Derivation_CCache_2>
      ffmpeg = super.ffmpeg.override {stdenv = super.ccacheStdenv;};
    })
  ];
}
