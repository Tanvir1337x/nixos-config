# Settings Configuration
{
  pkgs,
  config,
  ...
}: {
  environment.etc."issue".text = "Welcome to NixOS!\n";

  # Note: Don't forget to set a password with ‘passwd’
  users.users.root = {
    home = "/root";
    initialPassword = "root";
    shell = pkgs.zsh;
  };

  # Creates a file (/etc/current-system-packages) with list of all installed packages with their respective versions
  # `cat /etc/current-system-packages` or `bat /etc/current-system-packages`
  environment.etc."current-system-packages".text = let
    packages = builtins.map (p: "${p.name}") config.environment.systemPackages;
    sortedUnique = builtins.sort builtins.lessThan (pkgs.lib.lists.unique packages);
    formatted = builtins.concatStringsSep "\n" sortedUnique;
  in
    formatted;

  environment.variables = {
    # Telemetry
    # More at: <https://github.com/beatcracker/toptout>
    # <https://consoledonottrack.com>
    DO_NOT_TRACK = "1";

    # <https://learn.microsoft.com/en-us/dotnet/core/tools/telemetry#how-to-opt-out>
    DOTNET_CLI_TELEMETRY_OPTOUT = "1";

    # <https://docs.brew.sh/Analytics>
    HOMEBREW_NO_ANALYTICS = "1";

    # <https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_telemetry>
    POWERSHELL_TELEMETRY_OPTOUT = "1";

    # <https://docs.evidentlyai.com/support/telemetry#can-i-opt-out>
    EVIDENTLY_DISABLE_TELEMETRY = "1";

    # <https://docs.microsoft.com/en-us/cli/azure/azure-cli-configuration#cli-configuration-values-and-environment-variables>
    AZURE_CORE_COLLECT_TELEMETRY = "false";

    # <https://www.gatsbyjs.com/docs/telemetry>
    GATSBY_TELEMETRY_DISABLED = "1";

    # <https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-telemetry.html>
    SAM_CLI_TELEMETRY = "0";

    # <https://docs.driftctl.com/next/usage/flags/disable-telemetry>
    DCTL_DISABLE_TELEMETRY = "true";

    # <https://huggingface.co/docs/huggingface_hub/package_reference/environment_variables#hfhubdisabletelemetry>
    HF_HUB_DISABLE_TELEMETRY = "1";

    # <https://nextjs.org/telemetry#how-do-i-opt-out>
    NEXT_TELEMETRY_DISABLED = "1";

    # <https://v2.nuxt.com/docs/configuration-glossary/configuration-telemetry/#opting-out>
    NUXT_TELEMETRY_DISABLED = "1";

    # <https://flower.dev/docs/telemetry.html#how-to-opt-out>
    FLWR_TELEMETRY_ENABLED = "0";

    # <https://werf.io/documentation/v1.2/resources/telemetry.html#disabling-telemetry>
    WERF_TELEMETRY = "0";
    # End of Telemetry
  };

  environment.sessionVariables = {
    # EDITOR = "micro";
    # VISUAL = "micro";

    # XCURSOR_THEME = "Afterglow-Recolored-Catppuccin-Maroon";
    # XCURSOR_SIZE = "30";

    # QT_QPA_PLATFORM = "qt5ct";
    # QT_STYLE_OVERRIDE = "kvantum";

    # Prevents Qt5 from auto-scaling the UI depending on screen DPI
    # Fixes Okular being rendered in a different size and totally broken
    QT_AUTO_SCREEN_SCALE_FACTOR = "0";
    # Sets the UI scaling factor for Qt5
    # Helps fixing Okular
    QT_SCALE_FACTOR = "1";

    # Fix misbehavior where the application starts with a blank screen
    #- <https://bugs.openjdk.org/browse/JDK-8058197>
    #- <https://github.com/xmonad/xmonad/issues/126>
    #- <https://wiki.archlinux.org/title/wayland#Java>
    #- Can improve performance and reduce visual glitches
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };
}
