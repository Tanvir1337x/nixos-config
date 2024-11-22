# Kernel Configuration
#- <https://wiki.nixos.org/wiki/Linux_kernel>
# Kernel Configuration
{pkgs, ...}: {
  boot = {
    # # Search for (in nixpkgs): linuxKernel.kernels
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    # kernelPackages = pkgs.linuxPackages_latest;

    # consoleLogLevel = 4;

    kernelParams = [
      "quiet" # Reduces boot output messages for a cleaner boot screen
      "iommu=pt" # Enables IOMMU in passthrough mode for better virtualization support
      "mitigations=off" # Disables CPU vulnerability mitigations for improved performance at the cost of security
      "nowatchdog" # Disables kernel watchdog timers, preventing potential resets due to perceived hangs
      "pcie_aspm=off" # Disables Active State Power Management (ASPM) for PCIe devices
      "logo.nologo" # Disables the display of the kernel logo during boot
      /*
      "splash" # Enables a splash screen during boot
      "split_lock_detect=off" # Disables detection of split lock operations
      "rd.udev.log_level=4" # Sets the udev log level to 4
      */
    ];

    blacklistedKernelModules = [
      "ucsi_ccg" # USB Type-C UCSI driver
      "i915" # Intel integrated graphics driver
      "amdgpu" # AMD GPU driver
      "radeon" # Older AMD Radeon GPU driver
    ];

    # Recommended by steam to improve proton performance
    kernel.sysctl."vm.max_map_count" = 1048576;

    # To check kernel config: zcat /proc/config.gz
    /*
    kernelPatches = [
      {
        name = "performance";
        patch = null;
        # Drop the CONFIG_ prefix from the kernel configuration names
        # For Xanmod kernel
        extraConfig = ''
          MNATIVE_AMD y
          CC_OPTIMIZE_FOR_PERFORMANCE y
          KERNEL_ZSTD y
          MODULE_COMPRESS_XZ n
          MODULE_COMPRESS_ZSTD y
          HZ_500 n
          HZ_250 n
          HZ 1000
          HZ_1000 y
          PREEMPT_VOLUNTARY n
          PREEMPT y
          SPECULATION_MITIGATIONS n
          CPU_FREQ_DEFAULT_GOV_PERFORMANCE y
          CPU_FREQ_STAT y
          X86_AMD_PSTATE y
        '';
      }
    ];
    */

    # Register AppImage files as a binary type to binfmt_misc
    /*
    binfmt.registrations.appimage = {
      wrapInterpreterInShell = false;
      interpreter = "${pkgs.appimage-run}/bin/appimage-run";
      recognitionType = "magic";
      offset = 0;
      mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
      magicOrExtension = ''\x7fELF....AI\x02'';
    };
    */
  };
}
