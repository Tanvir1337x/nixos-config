# AwesomeWM Overlay Configuration
_: {
  nixpkgs.overlays = [
    (_self: super: {
      awesome-git = super.awesome.overrideAttrs {
        pname = "awesome-git";
        version = "2024.11.19-0f950cbb6";
        src = super.fetchFromGitHub {
          owner = "awesomeWM";
          repo = "awesome";
          rev = "0f950cbb625175134b45ea65acdf29b2cbe8c456";
          sha256 = "GIUkREl60vQ0cOalA37sCgn7Gv8j/9egfRk9emgGm/Y=";
        };

        patches = [];

        postPatch = ''
          patchShebangs tests/examples/_postprocess.lua
        '';
      };
    })
  ];
}
