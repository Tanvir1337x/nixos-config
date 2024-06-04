# Firewall Configuration
#- <https://nixos.wiki/wiki/Firewall>
{...}: {
  # The default firewall uses iptables
  # To use the newer nftables instead it needs to be enabled
  # Causes problem with Docker
  # Docker uses iptables internally to setup NAT for containers
  networking.nftables.enable = false;

  # Check the rules: iptables -L -v -n
  # nftables: nft list ruleset
  networking.firewall = {
    enable = true;
    allowPing = true;

    # Warning: Firewall rules may be overwritten by Docker
    # <https://github.com/NixOS/nixpkgs/issues/111852>
    interfaces = {
      "enp42s0" = {
        # Block all ports
        allowedTCPPorts = [];
        allowedUDPPorts = [];

        # Syncthing ports
        # 6433 is equired by k3s so that pod can reach the API server (running on port 6443 by default)
        # allowedTCPPorts = [6443 8384 22000];
        # allowedUDPPorts = [22000 21027];

        /*
        allowedTCPPortRanges = [
          # GS-/KDE-Connect
          {
            from = 1714;
            to = 1764;
          }
        ];

        allowedUDPPortRanges = [
          # {GS/KDE}-Connect
          {
            from = 1714;
            to = 1764;
          }
        ];
        */
      };
    };
  };
}
