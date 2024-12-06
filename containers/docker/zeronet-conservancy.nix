_: {
  virtualisation = {
    oci-containers = {
      backend = "docker";

      containers = {
        ZeronetConservancy = {
          image = "zeronet-conservancy:latest";
          autoStart = true;
          ports = [
            "43110:43110"
            "26552:26552"
          ];
          volumes = [
            "/home/user/docker/zeronet-conservancy:/app/data"
          ];
        };
      };
    };
  };
}
