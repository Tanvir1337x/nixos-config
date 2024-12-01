# Administration Configuration
{pkgs, ...}: {
  security = {
    sudo = {
      enable = true;
      wheelNeedsPassword = true;
      execWheelOnly = true;
      extraConfig = ''
        Defaults env_keep += "SSH_AUTH_SOCK"
      '';

      package = pkgs.sudo.override {withInsults = true;};
    };

    doas = {
      enable = true;
      extraRules = [
        {
          groups = ["wheel"];
          noPass = false;
          keepEnv = true;
          persist = true;
        }
      ];
    };

    please = {
      enable = true;
      wheelNeedsPassword = true;
    };
  };
}
