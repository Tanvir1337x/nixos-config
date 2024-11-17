# Tips

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
