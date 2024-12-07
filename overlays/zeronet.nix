# ZeroNet Overlay Configuration
_: {
  nixpkgs.overlays = [
    (_self: super: {
      # As on 07/12/2024 #
      # Zeronet-conservancy lead dev suggests waiting for v0.8.x release

      # Currently broken
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

      # Use/run this first
      zeronet-conservancy-past = super.zeronet-conservancy.overrideAttrs {
        pname = "zeronet-conservancy-past";
        version = "0.7.9";
        src = super.fetchFromGitHub {
          owner = "zeronet-conservancy";
          repo = "zeronet-conservancy";
          rev = "f966a4203fe33bd9f35695ee89893f5938f569e0";
          sha256 = "sha256-dS10T6r91xjylXiiXKMPdlbqwdEXbKoHWn6pS3L+bYU=";
        };
      };

      # Then this
      zeronet-conservancy-legacy = super.zeronet-conservancy.overrideAttrs {
        pname = "zeronet-conservancy-legacy";
        version = "2024.04.07-7772036";
        src = super.fetchFromGitHub {
          owner = "zeronet-conservancy";
          repo = "zeronet-conservancy";
          rev = "77720365590f5cfde50335c0c251d3a06012b8d5";
          sha256 = "sha256-hgH8WgkFKSi8FGCCK9oUbHUAzhRKTexVAhkfgB0xHPA=";
        };
      };
    })
  ];
}
