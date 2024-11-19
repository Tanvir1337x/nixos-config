# Flatpak Configuration
#- <https://wiki.nixos.org/wiki/Flatpak>
_: {
  /*
  REF: <https://wiki.nixos.org/wiki/Fonts#Flatpak_applications_can.27t_find_system_fonts>
  Flatpak applications can't find system fonts, themes (gtk, qt, icon, cursor, etc.)?
  Allow flatpak access the WHOLE filesystem:
  All system files in Flatseal or equivalently filesystem=host available to your application, the command for this is:
    flatpak --user override --filesystem=host
  */

  # Repositories
  #- flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
  #- flathub https://flathub.org/repo/flathub.flatpakrepo
  #- gnome-nightly https://nightly.gnome.org/gnome-nightly.flatpakrepo
  #- freedesktop-sdk https://flathub.org/repo/flathub.flatpakrepo

  # Flatpak
  services.flatpak.enable = false;

  # Must have apps:
  # - com.github.tchx84.Flatseal
  # - io.github.giantpinkrobots.flatsweep
}
