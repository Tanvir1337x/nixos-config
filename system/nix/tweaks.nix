# Nix-Specific Tweaks Configuration
_: {
  system.autoUpgrade = {
    enable = false;
    channel = "nixos";
    # Daily @6pm
    dates = "18:00";
    allowReboot = false;
  };

  nixpkgs.config = {
    # <https://wiki.nixos.org/wiki/FAQ/How_can_I_install_a_proprietary_or_unfree_package%3F#System-level_configuration_.28NixOS.29>
    allowUnfree = true;
    allowBroken = false;
    # Workaround for https://github.com/nix-community/home-manager/issues/2942
    # allowUnfreePredicate = _: true;
    allowUnsupportedSystem = false;
  };

  # Enable flakes
  # <https://nix-community.github.io/home-manager/index.html#sec-flakes-prerequisites>
  nix = {
    # package = pkgs.nixFlakes; # 'nixFlakes' has been renamed to/replaced by 'nixVersions.stable'
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
