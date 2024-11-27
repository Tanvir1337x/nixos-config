# WiFi Configuration
#- <https://wiki.nixos.org/wiki/Wpa_supplicant>
_: {
  # To be able to use wpa_gui or wpa_cli
  # Can not use networking.networkmanager with networking.wireless
  networking.wireless = {
    enable = false;
    userControlled.enable = true;
  };

  /*
  environment.systemPackages = with pkgs; [
    wpa_supplicant_gui # gui: Qt-based GUI for wpa_supplicant
  ];
  */
}
