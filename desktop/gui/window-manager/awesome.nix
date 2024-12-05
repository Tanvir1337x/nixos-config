# Awesome (WM) Configuration
# <https://wiki.nixos.org/wiki/Awesome>
{pkgs, ...}: {
  services = {
    xserver = {
      windowManager.awesome = {
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

        # Has no effect?
        # TODO: Investigate this issue
        luaModules = with pkgs.luajitPackages; [
          luarocks # A package manager for Lua
          # Required for lgi library
          # It has issues with nixos? (running `awesome -v`):
          # "LGI version: module 'lgi.version' not found:..."
          # But I'm able to require and use the lgi library in my configuration
          # TODO: Investigate this issue
          lgi # Lua bindings to GObject-based libraries
        ];
      };
    };
  };
}
