# PipeWire Configuration
#- <https://nixos.wiki/wiki/PipeWire>
{...}: let
  # Reference: <https://github.com/fufexan/nix-gaming>
  nix-gaming = import (builtins.fetchTarball "https://github.com/fufexan/nix-gaming/archive/master.tar.gz");
in {
  imports = [
    "${nix-gaming}/modules/pipewireLowLatency.nix"
  ];

  hardware.pulseaudio.enable = false;

  # make pipewire realtime-capable
  security.rtkit.enable = true;

  /*
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    wireplumber.enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };
  };
  */

  # pipewire low latency
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    wireplumber.enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };

    lowLatency = {
      enable = true;
      quantum = 64;
      rate = 48000;
    };
  };
}
