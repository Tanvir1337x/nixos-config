# Sudo Overlay Configuration
_: {
  nixpkgs.overlays = [
    (prev: {
      sudo = prev.sudo.override {withInsults = true;};
    })
  ];
}
