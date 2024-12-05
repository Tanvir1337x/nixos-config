# Antivirus Configuration
{pkgs, ...}: {
  services.clamav = {
    daemon = {
      enable = true;

      settings = {
        VirusEvent = "${pkgs.libnotify}/bin/notify-send 'ClamAV: Malware detected'";
      };
    };
    # keep the signatures' database updated
    updater.enable = true;
  };

  environment.systemPackages = with pkgs; [
    clamtk # gui: Easy to use, lightweight front-end for ClamAV (Clam Antivirus)
  ];
}
