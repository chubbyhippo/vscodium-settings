# vscodium-settings

VSCodium settings and extension install scripts.

| Item | Value |
|---|---|
| Modal editing | [codemeow](https://github.com/chubbyhippo/codemeow), a native port of Emacs [meow](https://github.com/meow-edit/meow) |
| Its keymap | ships inside the extension |
| Override keys in | `~/.codemeowrc` — `SPC c m` opens it, `SPC c M` reloads it |

## Install settings + default extensions

```sh
curl https://raw.githubusercontent.com/chubbyhippo/vscodium-settings/refs/heads/main/install.sh | /usr/bin/env sh
```

## Install codemeow

| Step | Do |
|---|---|
| 1 | `codium --uninstall-extension vscodevim.vim` — VSCodeVim conflicts on the `type` command |
| 2 | `git clone --depth 1 https://github.com/chubbyhippo/codemeow.git && cd codemeow && ./setup.sh` |
| 3 | Restart the editor |

| Requirement | Value |
|---|---|
| Toolchain | node 24, or [mise](https://mise.jdx.dev) |
| Targets | `~/.vscode-oss` on Linux/macOS; from WSL, the Windows editors too |

## Install extensions only

```sh
curl https://raw.githubusercontent.com/chubbyhippo/vscodium-settings/refs/heads/main/install-default-extensions.sh | /usr/bin/env sh
```

### clojure

```sh
curl https://raw.githubusercontent.com/chubbyhippo/vscodium-settings/refs/heads/main/extensions/clojure.sh | /usr/bin/env sh
```

### java

```sh
curl https://raw.githubusercontent.com/chubbyhippo/vscodium-settings/refs/heads/main/extensions/java.sh | /usr/bin/env sh
```

### python

```sh
curl https://raw.githubusercontent.com/chubbyhippo/vscodium-settings/refs/heads/main/extensions/python.sh | /usr/bin/env sh
```

## Uninstall all extensions

Runs twice so extensions that were only dependencies go too.

```sh
codium --list-extensions | xargs -L 1 codium --uninstall-extension;codium --list-extensions | xargs -L 1 codium --uninstall-extension
```
