# Home Manager Configuration Imports
# References:
#- <https://wiki.nixos.org/wiki/Home_Manager>
#- <https://nix-community.github.io/home-manager>
#- <https://github.com/nix-community/home-manager>
#- <https://mipmip.github.io/home-manager-option-search>
{
  # N.B. : Paths in nix expressions are always relative the file which defines them
  imports = [
    ./home-manager/no-defaults.nix

    ./home-manager/settings.nix
    ./home-manager/programs.nix
    ./home-manager/services.nix
    ./home-manager/packages.nix

    ./home-manager/customization/gtk.nix
    ./home-manager/customization/qt.nix
    ./home-manager/customization/xdg.nix
    ./home-manager/customization/misc.nix
  ];
}
