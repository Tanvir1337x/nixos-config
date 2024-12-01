# Common configuration for docker containers
# <https://wiki.nixos.org/wiki/Docker>
_: {
  virtualisation = {
    docker = {
      enable = true;
    };

    podman = {
      enable = false;
    };
  };
}
