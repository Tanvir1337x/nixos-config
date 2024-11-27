# Bluetooth Configuration
#- <https://wiki.nixos.org/wiki/Bluetooth>
_: {
  hardware.bluetooth = {
    enable = false;
    powerOnBoot = false;
    hsphfpd.enable = false;
  };
}
