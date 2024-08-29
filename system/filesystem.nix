# Filesystem Configuration
#- <https://wiki.nixos.org/wiki/Btrfs>
{modulesPath, ...}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd.availableKernelModules = [
      # "aesni_intel"
      # "cryptd" # Make encrypted boot quick. Ref: <https://wiki.nixos.org/wiki/Full_Disk_Encryption#Perf_test>
      "xhci_pci"
      "ahci"
      "usbhid"
      "sd_mod"
    ];

    kernelModules = ["kvm-amd"];

    supportedFilesystems = [
      "btrfs" #- <https://wiki.nixos.org/wiki/Btrfs>
      # "ext4"
      # "exfat"
      "tmpfs"
      "ntfs" #- <https://wiki.nixos.org/wiki/NTFS>
      # "bcachefs" #- <https://wiki.nixos.org/wiki/Bcachefs>
      # "zfs" #- <https://wiki.nixos.org/wiki/ZFS>
    ];
  };

  zramSwap = {
    enable = false;
    algorithm = "zstd";
    memoryPercent = 80;
    swapDevices = 1; # Recommended is 1
    priority = 10;
  };

  # Swap
  #- <https://wiki.nixos.org/wiki/Swap>
  #- <https://wiki.nixos.org/wiki/Btrfs#Swap_file>
  # swapDevices = lib.mkForce []; # Disable swap devices
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      # label = "swap";
      # Create new swap space of size 12 GB
      size = 12 * 1024; # in megabytes

      # Priority is a value between 0 and 32767. Higher numbers indicate higher priority.
      # Default is null which lets the kernel choose a priority, which will show up as a negative value
      # If you have only one swap device (partition or file), its priority does not matter much.
      # You can use the default priority, which is typically 1.
      priority = 1;

      /*
      Tip: run “cryptsetup benchmark” to test cipher performance on your machine.

      WARNING #1: Don’t try to hibernate when you have at least one swap partition with this
      option enabled! We have no way to set the partition into which hibernation image is saved,
      so if your image ends up on an encrypted one you would lose it!

      WARNING #2: Do not use /dev/disk/by-uuid/… or /dev/disk/by-label/… as your swap device
      when using randomEncryption as the UUIDs and labels will get erased on every boot when
      the partition is encrypted. Best to use /dev/disk/by-partuuid/…
      */
      randomEncryption.enable = false;
    }
  ];

  # TMPFS
  # for /tmp
  boot.tmp = {
    useTmpfs = false;
    tmpfsSize = "80%";
  };

  /*
  boot.initrd.luks.devices = {
    root = {
      device = "/dev/disk/by-uuid/0d63094a-cff7-473d-bec7-6da624473feb";
      preLVM = true;
    };
  };
  */

  fileSystems = {
    #- List btfs subvolumes: `<su> btrfs subvolume list /`
    "/" = {
      device = "/dev/disk/by-uuid/2d9be16a-ddf3-43fc-8fd6-85d53984c447";
      fsType = "btrfs";
      options = ["subvol=root" "compress=zstd:8" "noatime" "nodiratime" "ssd_spread" "discard=async" "space_cache=v2"];
      neededForBoot = true;
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/FEB0-B2ED";
      fsType = "vfat";
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/2d9be16a-ddf3-43fc-8fd6-85d53984c447";
      fsType = "btrfs";
      /*
      Since the /nix mount point is used for the Nix package manager and stores the installed packages,
      it's likely that many of the files on this filesystem are read frequently.

      By setting the noatime option, the kernel no longer updates the atime attribute when a file is read,
      which can reduce the number of disk writes and improve performance, especially for read-heavy workloads.

      Therefore, setting noatime for this mount point can help reduce unnecessary
      disk writes and improve performance.
      */
      options = ["subvol=nix" "compress=zstd:8" "noatime" "nodiratime" "ssd_spread" "discard=async" "space_cache=v2"];
      neededForBoot = true;
    };

    "/home" = {
      device = "/dev/disk/by-uuid/2d9be16a-ddf3-43fc-8fd6-85d53984c447";
      fsType = "btrfs";
      options = ["subvol=home" "compress=zstd:8" "noatime" "nodiratime" "ssd_spread" "discard=async" "space_cache=v2"];
    };

    # HDDs
    "/mnt/media1" = {
      device = "/dev/disk/by-uuid/2decf340-db87-4575-b46f-46c0bd0d585f";
      fsType = "btrfs";
      options = ["compress=zstd:6" "noatime" "nodiratime" "autodefrag" "space_cache=v2"];
    };

    "/mnt/media2" = {
      device = "/dev/disk/by-uuid/19555de1-efde-4669-8544-034e2a5dd6d7";
      fsType = "btrfs";
      options = ["compress=zstd:6" "noatime" "nodiratime" "autodefrag" "space_cache=v2"];
    };
    /*
    "/mnt/radare" = {
      device = "/dev/disk/by-uuid/";
      fsType = "btrfs";
      options = ["compress=zstd:6" "noatime" "nodiratime" "autodefrag" "space_cache=v2"];
    };

    "/mnt/sonare" = {
      device = "/dev/disk/by-uuid/";
      fsType = "btrfs";
      options = ["compress=zstd:6" "noatime" "nodiratime" "autodefrag" "space_cache=v2"];
    };

    "/mnt/whispare" = {
      device = "/dev/disk/by-uuid/";
      fsType = "btrfs";
      options = ["compress=zstd:6" "noatime" "nodiratime" "autodefrag" "space_cache=v2"];
    };

    # SSDs
    "/mnt/homare" = {
      device = "/dev/disk/by-uuid/";
      fsType = "btrfs";
      options = ["compress=zstd:7" "noatime" "nodiratime" "ssd_spread" "discard=async" "space_cache=v2"];
    };
    */

    # Game Drives
    "/mnt/games" = {
      device = "/dev/disk/by-uuid/00A92F5122DAD236";
      fsType = "ntfs-3g";
      options = ["rw" "uid=1000"];
    };
    # ntfs drives - Requires fast boot to be disabled in Windows for write support
    /*
    "/mnt/gamedrive1" = {
      device = "/dev/disk/by-uuid/";
      fsType = "ntfs-3g";
      options = ["rw" "uid=1000"];
    };

    "/mnt/gamedrive2" = {
      device = "/dev/disk/by-uuid/";
      fsType = "ntfs-3g";
      options = ["rw" "uid=1000"];
    };

    "/mnt/gamedrive3" = {
      device = "/dev/disk/by-uuid/";
      fsType = "ntfs-3g";
      options = ["rw" "uid=1000"];
    };
    */

    # <https://wiki.nixos.org/wiki/NTFS>
    # Windows Partition
    "/mnt/windows" = {
      device = "/dev/disk/by-uuid/DC28A61F28A5F8A2";
      fsType = "ntfs-3g";
      options = ["rw" "uid=1000"]; # Requires fast boot to be disabled in Windows for write support
    };
  };
}
