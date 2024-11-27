# CK's MuQSS Process/CPU Scheduler, Overlay Configuration
# <https://wiki.nixos.org/wiki/Linux_kernel#Custom_configuration>
{
  pkgs,
  lib,
  ...
}: {
  nixpkgs = {
    overlays = [
      (_self: _super: {
        linuxZenWMuQSS = pkgs.linuxPackagesFor (
          pkgs.linux_zen.kernel.override {
            structuredExtraConfig = with lib.kernel; {
              SCHED_MUQSS = yes;
            };
            ignoreConfigErrors = true;
          }
        );
      })
    ];
  };
}
