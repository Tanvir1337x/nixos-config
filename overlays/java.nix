# Java Overlay Configuration
_: {
  nixpkgs.overlays = [
    (self: super: {
      # Override the jdk8 certificate store by overriding the cacert parameter of the package
      # <https://wiki.nixos.org/wiki/Java#Overriding_java_jks_Certificate_Store>
      myjdk = super.jdk8.override {
        cacert = self.runCommand "mycacert" {} ''
          mkdir -p $out/etc/ssl/certs
          cat ${self.cacert}/etc/ssl/certs/ca-bundle.crt \
            ${./my-company-root-certificate.crt} > $out/etc/ssl/certs/ca-bundle.crt
        '';
      };
    })
  ];
}
