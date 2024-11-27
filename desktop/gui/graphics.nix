# Graphics Configuration
#- <https://wiki.nixos.org/wiki/OpenGL>
# As of 25/06/2024, hardware.opengl has been renamed to hardware.graphics
_: {
  hardware.graphics = {
    # enable = true; # Don't have to enable manually as this option should be enabled by default by the corresponding modules
    enable32Bit = true; # 32-bit drivers for 32-bit applications (such as Wine)
  };
}
