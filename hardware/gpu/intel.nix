# GPU (Intel) Configuration
#- <https://wiki.nixos.org/wiki/Intel_Graphics>
{
  pkgs,
  lib,
  config,
  ...
}: {
  boot.initrd.kernelModules = ["i915"];

  environment.variables = {
    VDPAU_DRIVER = lib.mkIf config.hardware.graphics.enable (lib.mkDefault "va_gl");
  };

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override {enableHybridCodec = true;};
  };

  hardware.graphics = {
    # driSupport = true; # <https://nixos.org/manual/nixos/unstable/index.html#sec-gpu-accel>
    # enable32Bit = true; # 32-bit drivers for 32-bit applications (such as Wine)
    extraPackages = with pkgs; [
      vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      libvdpau-va-gl
      vaapiVdpau
      intel-ocl
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
    ];
  };
}
