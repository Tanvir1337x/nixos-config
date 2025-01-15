# VPN (OpenVPN) Configuration
#- <https://nixos.wiki/wiki/OpenVPN>
_: {
  services.openvpn.servers = {
    ProtonVPN = {
      config = ''config /root/nixos/openvpn/ProtonVPN.conf'';
    };

    ProtonVPN.autoStart = true;
    ProtonVPN.updateResolvConf = true;
  };
}
