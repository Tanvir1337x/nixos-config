# NGINX Overlay Configuration
# <https://wiki.nixos.org/wiki/Nginx>
_: {
  nixpkgs.overlays = [
    (_final: super: {
      # Use LibreSSL instead of OpenSSL
      # <https://wiki.nixos.org/wiki/Nginx#Replace_dependencies_like_openssl>
      # services.nginx.package = pkgs.nginxStable.override { openssl = pkgs.libressl; };
      nginxStable = super.nginxStable.override {openssl = super.pkgs.libressl;};
    })
  ];
}
