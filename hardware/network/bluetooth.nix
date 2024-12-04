# Bluetooth Configuration
#- <https://wiki.nixos.org/wiki/Bluetooth>
_: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    hsphfpd.enable = false;
  };
}
