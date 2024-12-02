# Plymouth Configuration
{pkgs, ...}: {
  boot.plymouth = {
    enable = false;
    theme = "dna";
    themePackages = with pkgs; [adi1090x-plymouth-themes];
  };
}
