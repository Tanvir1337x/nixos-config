# GPU (AMD) Configuration
#- <https://wiki.nixos.org/wiki/AMD_GPU>
{pkgs, ...}: {
  # amdgpu is the open source driver for AMD GPUs
  services.xserver.videoDrivers = ["amdgpu"];

  hardware.amdgpu = {
    # Vulkan
    amdvlk = {
      enable = true;
      supportExperimental.enable = true;
      package = pkgs.amdvlk;

      support32Bit = {
        enable = false;
        package = pkgs.driversi686Linux.amdvlk;
      };
    };

    # Load amdgpu kernelModule in stage 1.
    # fixes lower resolution in boot screen during initramfs phase
    initrd.enable = true;
    legacySupport.enable = false;
  };

  # HIP
  # <https://wiki.nixos.org/wiki/AMD_GPU#HIP>
  systemd.tmpfiles.rules = let
    rocmEnv = pkgs.symlinkJoin {
      name = "rocm-combined";
      paths = with pkgs.rocmPackages; [
        rocblas
        hipblas
        clr
      ];
    };
  in [
    "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
  ];

  hardware.graphics.extraPackages = with pkgs; [
    # OpenCL
    # <https://wiki.nixos.org/wiki/AMD_GPU#OpenCL>
    rocmPackages.clr.icd

    # Vulkan
    # amdvlk
    # driversi686Linux.amdvlk
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
