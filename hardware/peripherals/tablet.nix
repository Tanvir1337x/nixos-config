# Tablet Configuration
# <https://opentabletdriver.net>
{pkgs, ...}: {
  hardware.opentabletdriver = {
    # For Gaomon S620
    #- Supported Tablets: <https://opentabletdriver.net/Tablets>
    enable = true;
    daemon.enable = true;
    package = pkgs.opentabletdriver;
  };
}
