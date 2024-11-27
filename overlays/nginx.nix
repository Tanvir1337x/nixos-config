# <https://wiki.nixos.org/wiki/Nginx>
_: {
  nixpkgs.overlays = [
    (_final: super: {
      # Use LibreSSL instead of OpenSSL
      # services.nginx.package = pkgs.nginxStable.override { openssl = pkgs.libressl; };
      nginxStable = super.nginxStable.override {openssl = super.pkgs.libressl;};
    })
  ];
}
