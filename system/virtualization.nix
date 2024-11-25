# Virtualization Configuration
{pkgs, ...}: {
  # <https://wiki.nixos.org/wiki/Virt-manager>
  # <https://wiki.nixos.org/wiki/Libvirt>
  virtualisation = {
    # Enable USB redirection for Spice
    spiceUSBRedirection.enable = true;

    # Linux Containers (LXC), which provides tools for creating and managing system
    # or application containers
    lxc = {
      # enable = false;
      package = pkgs.lxc;

      # LXCFS is a FUSE filesystem for LXC
      lxcfs.enable = true;
    };

    # Daemon to manage containers
    # using the lxc command line tool
    lxd = {
      enable = false;
      package = pkgs.lxd-lts;
      agent.enable = true;
      # Enables various settings to avoid common pitfalls when
      # running containers requiring many file operations.
      # Fixes errors like “Too many open files”
      # or “neighbour: ndisc_cache: neighbor table overflow!”.
      # See https://lxd.readthedocs.io/en/latest/production-setup/ for details.
      recommendedSysctlSettings = true;

      # Experimental LXD UI
      ui = {
        enable = true;
        package = pkgs.lxd-ui;
      };
    };

    libvirtd = {
      enable = true;

      nss = {
        enable = true;
        enableGuest = true;
      };

      qemu = {
        runAsRoot = true;
        # pkgs.qemu can emulate alien architectures (e.g. aarch64 on x86)
        # pkgs.qemu_kvm saves disk space allowing to emulate only host architectures.
        package = pkgs.qemu;

        ovmf = {
          enable = true;
          packages = [
            (pkgs.OVMF.override {
              secureBoot = true;
              tpmSupport = true;
            })
            .fd
          ];
        };

        swtpm = {
          enable = true;
          package = pkgs.swtpm;
        };
      };
    };

    #- Xen currently does not support EFI boot
    xen.enable = false;

    # <https://wiki.nixos.org/wiki/VirtualBox>
    virtualbox = {
      guest.clipboard = true;

      host = {
        enable = false;
        # Note: Needs a lot of compilation
        # Oracle Extension Pack can be manually downloaded:
        # nix-prefetch-url https://download.virtualbox.org/virtualbox/7.0.18/Oracle_VM_VirtualBox_Extension_Pack-7.0.18-162988.vbox-extpack
        enableExtensionPack = true;
      };
    };

    # <https://wiki.nixos.org/wiki/WayDroid>
    # Wayland Only
    # Running on X11 (use weston package in X11 session): <https://github.com/waydroid/waydroid/issues/195#issuecomment-953926526>
    waydroid.enable = true;

    # <https://wiki.nixos.org/wiki/Docker>
    docker = {
      enable = false;

      # Deprecated, use hardware.nvidia-container-toolkit.enable instead
      enableNvidia = false;
      storageDriver = "btrfs";

      # Extra packages to add to PATH for the docker daemon process
      extraPackages = with pkgs; [
        docker-compose # plugin: Docker CLI plugin to define and run multi-container applications with Docker
      ];

      autoPrune = {
        enable = false;
        dates = "weekly";
      };
    };

    podman = {
      enable = false;

      # Deprecated, use hardware.nvidia-container-toolkit.enable instead
      enableNvidia = false;

      # Extra packages to be installed in the Podman wrapper
      extraPackages = with pkgs; [
        podman-compose
        gvisor
      ];

      autoPrune = {
        enable = false;
        dates = "weekly";
      };

      dockerSocket.enable = false;
      dockerCompat = false;
    };
  };

  # <https://github.com/kholia/OSX-KVM>
  # Required by AMD boxes for OSX-KVM
  /*
  boot.extraModprobeConfig = ''
    options kvm_amd nested=1
    options kvm ignore_msrs=1 report_ignored_msrs=0
  '';
  */

  # For Intel:
  /*
  options kvm_intel nested=1
    options kvm_intel emulate_invalid_guest_state=0
    options kvm ignore_msrs=1
  */
}
