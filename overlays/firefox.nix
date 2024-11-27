# Firefox Overlay Configuration
# <https://wiki.nixos.org/wiki/Firefox>
{pkgs, ...}: {
  # Firefox Nightly
  nixpkgs.overlays = let
    moz-rev = "master"; # Change this to a rev sha to pin
    moz-url = builtins.fetchTarball {url = "https://github.com/mozilla/nixpkgs-mozilla/archive/${moz-rev}.tar.gz";};
    nightlyOverlay = import "${moz-url}/firefox-overlay.nix";
  in [
    nightlyOverlay
  ];
  environment.systemPackages = with pkgs; [latest.firefox-nightly-bin];
}
