# Virtual Reality (VR) Configuration
# <https://wiki.nixos.org/wiki/VR>
#- <https://lvra.gitlab.io>
#- <https://lvra.gitlab.io/docs/fossvr/monado/>
_: {
  services.monado = {
    enable = true;
    defaultRuntime = true; # Register as default OpenXR runtime
  };

  systemd.user.services.monado.environment = {
    #- <https://monado.freedesktop.org/getting-started.html#environment-variables>
    STEAMVR_LH_ENABLE = "1";
    XRT_COMPOSITOR_COMPUTE = "1";

    # Running monado-services will fail due to the lack of hand tracking data.
    # There are 2 ways to remedy this, either disable hand tracking altogether,
    # or download the hand tracking data.
    # To get hand tracking to work, git-lfs has to be enabled. Then after executing the following services
    # restart monado-service:
    # $ mkdir -p ~/.local/share/monado
    # $ cd ~/.local/share/monado
    # $ git clone https://gitlab.freedesktop.org/monado/utilities/hand-tracking-models
    # Disable hand tracking
    WMR_HANDTRACKING = "0";
  };
}
