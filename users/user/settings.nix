# User's Settings Configuration
{pkgs, ...}: {
  # Note: Removing a user does not remove its profile: <https://github.com/NixOS/nix/issues/4419>
  # Note: Don't forget to set a password with ‘passwd’
  users = {
    motd = "Today is your canvas, paint it with enthusiasm and purpose!";

    users.user = {
      description = "user";
      home = "/home/user";
      isNormalUser = true;
      initialPassword = "user";
      shell = pkgs.fish;
      uid = 1000;

      #- Groups that the user belongs: `groups`
      #- Check member of a particular group `getent group <group>`
      #- Check the available groups `cut -d: -f1 /etc/group`
      extraGroups = [
        "wheel"
        "audio"
        "video"
        "disk"
        "input"
        "network"
        "networkmanager"
        "flatpak"
        "kvm"
        "libvirtd"
        "adbusers"
        "aria2"
        "docker"
        "gamemode"
        # "nginx"
        # "dialout"
        # "boinc"
        # config.services.kubo.group
        # "libvirt"
        # "vboxusers"
        # "wireshark"
      ];
    };

    extraGroups = {
      vboxusers.members = ["user"];
      docker.members = ["user"];
      searx.members = ["nginx"];
      nginx.members = ["acme"];
    };
  };

  environment.shells = [pkgs.fish];
}
