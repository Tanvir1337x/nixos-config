# ZeroNet Overlay Configuration
_: {
  nixpkgs.overlays = [
    (_self: super: {
      zeronet-conservancy-git = super.zeronet-conservancy.overrideAttrs {
        pname = "zeronet-conservancy-git";
        version = "2024.10.26-2d2ed3c";
        src = super.fetchFromGitHub {
          owner = "zeronet-conservancy";
          repo = "zeronet-conservancy";
          rev = "2d2ed3c0e9b41d9d41f12792d1ff8fa4e518e995";
          sha256 = "sha256-jF6v2tGakjgIrjKMLw5UQzD2hj/oV/14bC3bwCLFYnY=";
        };
      };
    })
  ];
}
