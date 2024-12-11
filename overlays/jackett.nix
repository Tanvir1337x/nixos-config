# Jackett Overlay Configuration
# <https://github.com/Jackett/Jackett>
_: {
  nixpkgs.overlays = [
    (_self: super: {
      # Currently broken
      # Jackett has nuget dependencies that needs to be manually updated as well
      # See: <https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/servers/jackett/default.nix#L23>
      # <https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/servers/jackett/deps.nix>
      # <https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/servers/jackett/updater.sh>
      jackett-git = super.jackett.overrideAttrs {
        pname = "jackett-git";
        version = "2024.12.10-8af315";
        src = super.fetchFromGitHub {
          owner = "Jackett";
          repo = "Jackett";
          rev = "8af315c5c57d9c8704e1cc0145cddf0c556d68ce";
          sha256 = "";
        };
      };
    })
  ];
}
