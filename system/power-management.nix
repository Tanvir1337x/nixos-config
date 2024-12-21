# Power Management Configuration
_: {
  powerManagement = {
    enable = true; # This includes support for suspend-to-RAM and powersave features.
    # See other options here: <https://www.kernel.org/doc/html/v4.14/admin-guide/pm/cpufreq.html>
    # Can also be changed through kernel config (CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y)
    # To check cpu governor: cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
    cpuFreqGovernor = "performance";
  };

  /*
  services.hddfancontrol = {
    enable = false;
    extraArgs = ["--spin-down-time=60"];
    disks = [
      "/dev/disk/by-uuid/" # /mnt/_1
      "/dev/disk/by-uuid/" # /mnt/_2
      "/dev/disk/by-uuid/" # /mnt/_3
    ];
    pwmPaths = [
      "/sys/class/hwmon/hwmon1/device"
    ];
  };
  */
}
