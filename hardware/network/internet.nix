# Internet (Ethernet/WIFI) Configuration
#- <https://wiki.nixos.org/wiki/Networking>
_: {
  networking = {
    useDHCP = false;
    hostName = "Cookie";
    # Available: enp42s0 (ethernet) and wlp41s0 (wifi)
    interfaces.enp42s0.useDHCP = true;
    # Issue with DNS resolution (/etc/resolv.conf)
    resolvconf.dnsExtensionMechanism = false;

    enableIPv6 = true;

    networkmanager = {
      enable = true;
      # <https://wiki.nixos.org/wiki/Wpa_supplicant>
      wifi = {
        backend = "wpa_supplicant";
        macAddress = "random"; # Generate a randomized value upon each connection
        powersave = false;
        scanRandMacAddress = true;
      };
    };

    # /etc/resolv.conf
    nameservers = [
      # Public DNS Servers
      "9.9.9.9" # Quad9 Primary
      "149.112.112.112" # Quad9 Secondary
      /*
      "1.1.1.1" # Cloudflare Primary
      "1.0.0.1" # Cloudflare Secondary
      "76.76.19.19" # Alternate DNS Primary
      "76.223.122.150" # Alternate DNS Secondary
      "8.8.8.8" # Google Primary
      "8.8.4.4" # Google Secondary
      "95.85.95.85" # Gcore Primary
      "2.56.220.2" # Gcore Secondary
      "94.140.14.14" # AdGuard Primary
      "94.140.15.15" # AdGuard Secondary
      */
    ];

    extraHosts = ''
      127.0.0.1 searxng.local
      ::11 searxng.local

      127.0.0.1 activitywatch.local
      ::11 activitywatch.local

      127.0.0.1 jackett.local
      ::11 jackett.local

      127.0.0.1 flaresolverr.local
      ::11 flaresolverr.local
    '';

    # <https://wiki.nixos.org/wiki/WireGuard>
    wireguard.enable = false;

    stevenblack = {
      enable = true;
      block = ["fakenews" "gambling"];
    };
  };
}
