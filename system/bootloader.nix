# Bootloader Configuration
#- https://wiki.nixos.org/wiki/Bootloader
# NOTE: Setup <https://github.com/nix-community/lanzaboote>
_: {
  boot.loader = {
    systemd-boot = {
      enable = true;
      # https://wiki.nixos.org/wiki/Bootloader#Limiting_amount_of_entries_with_grub
      configurationLimit = 14;

      # Allow editing the kernel command-line before boot
      # enabled by default for backwards compatibility
      # Recommended to set this to false,
      # as it allows gaining root access by passing
      # init=/bin/sh as a kernel parameter
      editor = false;

      # Set the highest resolution available
      consoleMode = "max";

      # <https://wiki.nixos.org/wiki/Netboot#netboot.xyz>
      # A menu system that allows you to boot OS installers and utilities over the network
      # iPXE must be recent enough to support https:// links
      netbootxyz.enable = true;

      memtest86.enable = true;

      edk2-uefi-shell.enable = true;

      rebootForBitlocker = false; # Experimental BitLocker support
    };

    efi.canTouchEfiVariables = true;
  };
}
