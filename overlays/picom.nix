# Picom Overlay Configuration
_: {
  nixpkgs.overlays = [
    (_self: super: {
      picom-pijulius-git = super.picom.overrideAttrs {
        pname = "picom-pijulius-git";
        version = "2024.12.05-9b7d7";
        src = super.fetchFromGitHub {
          owner = "pijulius";
          repo = "picom";
          rev = "9b7d7bdaee0c697f416e3d6b41f1453aeaa07c78";
          sha256 = "sha256-9HCtbRwDrjB/i89O5igPdyxHo8AKiznltrjTdBjenlk=";
        };

        dontVersionCheck = true;
        mainProgram = "picom";
      };
    })
  ];
}
