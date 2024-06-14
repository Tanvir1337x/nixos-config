# Configuration with TOML

NixOS Can be Configured with TOML.

> [!CAUTION]
> Don't tell anyone.

```nix
# configuration.nix
imports = [
    (builtins.fromTOML (builtins.readFile ./config.toml))
]
```

```nix
# config.toml
[boot]
loader.systemd-boot.enable = true

[programs.git]
enable = true
lfs.enable = true
```