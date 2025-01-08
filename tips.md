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

This creates a file (`/etc/current-system-packages`) with list of all installed packages with their respective versions. You can then view it easily like: `cat /etc/current-system-packages` or `bat /etc/current-system-packages`.

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

## Skip a test-suite

To disable running the test-suite for specific packages, set `doCheck = false` in the relevant derivations. Examples:

```nix
self: super: {
  <package> = super.<package>.overrideAttrs (old: {
    doCheck = false;
    doInstallCheck = false;
  });
}
```

For Python packages:

```nix
python = pkgs.python3.override {
  self = python;
  packageOverrides = fin: prev: {
    jupyterlab-server = prev.jupyterlab-server.overridePythonAttrs {
      doCheck = false;
    };
  }
};
```

## Kernel

The Linux kernel does not have Rust language support enabled by default. For kernel versions 6.7 or newer, experimental Rust support can be enabled. In a NixOS configuration, set ([Ref](https://nixos.org/manual/nixos/unstable/index.html#sec-linux-rust)):

```nix
boot.kernelPatches = [
    {
      name = "Rust Support";
      patch = null;
      features = {
        rust = true;
      };
    }
];
```
