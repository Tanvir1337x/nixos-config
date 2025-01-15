_: {
  virtualisation = {
    oci-containers = {
      backend = "docker";

      containers = {
        qbittorrent = {
          # <https://hotio.dev/containers/qbittorrent>
          image = "ghcr.io/hotio/qbittorrent";
          autoStart = true;
          ports = ["8080:8080"];

          environment = {
            PUID = "1000";
            PGID = "1000";
            UMASK = "002";
            TZ = "Asia/Dhaka";
            WEBUI_PORTS = "8080/tcp,8080/udp";
          };

          volumes = [
            "/<host_folder_config>:/config"
            "/<host_folder_data>:/data"
          ];
        };
      };
    };
  };
}
