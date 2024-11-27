# Kernel Configuration
#- <https://wiki.nixos.org/wiki/Linux_kernel>
# Kernel Configuration
{pkgs, ...}: {
  boot = {
    # Search for `linuxKernel.kernels` in nixpkgs/package search
    # kernelPackages = pkgs.linuxPackages_latest; # https://www.kernel.org
    # kernelPackages = pkgs.linuxPackages_zen; # https://github.com/zen-kernel/zen-kernel
    # kernelPackages = pkgs.linuxPackages_lqx; # https://liquorix.net
    kernelPackages = pkgs.linuxPackages_xanmod_latest; # https://xanmod.org

    # consoleLogLevel = 4;

    # The Linux kernel does not have Rust language support enabled by default.
    # Enable experimental Rust support (for kernel versions >=6.7):
    /*
    kernelPatches = [
      {
        name = "Rust Support";
        patch = null;
        features = {
          rust = true;
        };
      }
    ];
    */

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
    # TODO: Disable debug and other unnecessary items to further optimize the kernel and reduce compile time
    kernelPatches = [
      # This causes the kernel to build from source with the specified configuration
      # WARNING: This will take a really long time to build
      # Thus entire nixos-rebuild process will take a long time
      {
        name = "Optimized Xanmod Config";
        patch = null;
        # Drop the CONFIG_ prefix from the kernel configuration names
        # For Xanmod kernel
        # CAUTION: Don't include newlines in extraConfig. It breaks the configuration file generation.
        extraConfig = ''
          WERROR y
          DEFAULT_HOSTNAME Cookie
          MNATIVE_AMD y
          CC_OPTIMIZE_FOR_PERFORMANCE y
          KERNEL_ZSTD y
          MODULE_COMPRESS_NONE n
          MODULE_COMPRESS_GZIP n
          MODULE_COMPRESS_XZ n
          MODULE_COMPRESS_ZSTD y
          ZSWAP_COMPRESSOR_DEFAULT_ZSTD y
          HIBERNATION_COMP_LZO n
          HIBERNATION_COMP_LZ4 y
          HZ_100 n
          HZ_250 n
          HZ_300 n
          HZ_500 n
          NO_HZ_FULL y
          HZ 1000
          HZ_1000 y
          CPU_FREQ_DEFAULT_GOV_PERFORMANCE y
          CPU_FREQ_STAT y
          X86_AMD_PSTATE y
          SCHED_CORE n
          PREEMPT y
          PREEMPT_VOLUNTARY n
          PREEMPT_DYNAMIC y
          TCP_CONG_BBR y
          DEFAULT_BBR y
          DEFAULT_TCP_CONG bbr
          RCU_EXPERT y
          RCU_BOOST y
          RCU_BOOST_DELAY 0
          RCU_EXP_KTHREAD y
          SCHEDSTATS y
        '';
      }
      # For Zen
      /*
      ZEN_INTERACTIVE y
      SCHED_CLASS_EXT y
      SCHED_ALT y
      SCHED_PDS y
      */
    ];

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
