# AwesomeWM Configuration For Home Manager User
_: let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.user = {pkgs, ...}: {
    xsession.windowManager = {
      awesome = {
        enable = true;
        noArgb = false;

        package = pkgs.awesome.override {
          lua = pkgs.luajit;
          # lua = pkgs.luajit.withPackages (ps: with ps; [lgi]);

          # Needed for beautiful.gtk to work
          # <https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/window-managers/awesome/default.nix#L13>
          # Causes svg icons to appear extremely small on my configuration
          # TODO: Investigate this issue
          # gtk3Support = true;
        };
      };
    };

    home.file.".xinitrc".text = ''
      [[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
      exec awesome
    '';
  };
}
