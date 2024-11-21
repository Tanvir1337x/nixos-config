# Tips

## General

### Installed packages

See list of all installed system packages along with their respective versions:

```bash
nix-store -q --references /var/run/current-system/sw | cut -d "-" -f2-
```

Or, you may put this code in your `configuration.nix`:

```nix
environment.etc."current-system-packages".text = let
    packages = builtins.map (p: "${p.name}") config.environment.systemPackages;
    sortedUnique = builtins.sort builtins.lessThan (pkgs.lib.lists.unique packages);
    formatted = builtins.concatStringsSep "\n" sortedUnique;
  in
    formatted;
```

This creates a file (`/etc/current-system-packages`) with list of all installed packages with their respective versions. You can then view it easily like: `cat/bat /etc/current-system-packages`.

## Home-Manager

To check the full log for rebuild failures caused by `home-manager.service`, run:

```shell
journalctl -u home-manager-user.service
```

To (temporarily) avoid writing a(n) (existing) xdg config file:

```nix
xdg.configFile."<dir>/<config.extension>".enable = false;
```

in `home-manager.users.<user>`. See [this](https://home-manager-options.extranix.com/?query=xdg.configFile.&release=master).
