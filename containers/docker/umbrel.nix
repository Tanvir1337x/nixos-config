# <https://github.com/dockur/umbrel>
_: {
  virtualisation = {
    oci-containers = {
      backend = "docker";

      containers = {
        Umbrel = {
          image = "dockurr/umbrel:latest";
          autoStart = true;
          ports = ["9342:80"];
          volumes = [
            "/home/user/docker/umbrel:/data"
            "/var/run/docker.sock:/var/run/docker.sock"
          ];
          pid = "host";
        };
      };
    };
  };
}
