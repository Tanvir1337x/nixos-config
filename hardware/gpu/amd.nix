# GPU (AMD) Configuration
#- <https://wiki.nixos.org/wiki/AMD_GPU>
{pkgs, ...}: {
  # amdgpu is the open source driver for AMD GPUs
  services.xserver.videoDrivers = ["amdgpu"];

  # HIP
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.hip}"
  ];

  hardware.graphics.extraPackages = with pkgs; [
    # OpenCL
    # <https://wiki.nixos.org/wiki/AMD_GPU#OpenCL>
    rocmPackages.clr.icd

    # Vulkan
    amdvlk
    driversi686Linux.amdvlk
  ];

  # LACT (Linux AMDGPU Controller)
  environment.systemPackages = with pkgs; [lact];
  systemd = {
    packages = with pkgs; [lact];
    services.lactd.wantedBy = ["multi-user.target"];
  };

  # For Radeon 500 series (aka Polaris)
  # As of ROCm 4.5, AMD has disabled OpenCL on Polaris-based cards.
  /*
  environment.variables = {
    ROC_ENABLE_PRE_VEGA = "1";
  };
  */
}
