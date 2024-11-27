# Git Overlay Configuration
{pkgs, ...}: {
  # pkgs.git-with-gui
  nixpkgs.overlays = [
    (_final: prev: {
      git-with-gui = prev.git.override {
        guiSupport = true;
        curl = pkgs.curlFull;
      };
    })
  ];
}
