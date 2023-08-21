# User's Settings Configuration
{
  pkgs,
  config,
  ...
}: {
  # Note: Removing a user does not remove its profile: <https://github.com/NixOS/nix/issues/4419>
  # Note: Don't forget to set a password with ‘passwd’
  users.users.user = {
    description = "user";
    home = "/home/user";
    isNormalUser = true;
    initialPassword = "user";
    shell = pkgs.fish;
    uid = 1001;

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
      # "boinc"
      config.services.kubo.group
    ];
  };

  users.extraGroups = {
    vboxusers.members = ["user"];
    docker.members = ["user"];
  };

  environment.shells = [pkgs.fish];
}
