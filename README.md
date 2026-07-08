# vscodium-settings

VSCodium settings and extension install scripts. Modal editing comes from
[codemeow](https://github.com/chubbyhippo/codemeow), a native port of Emacs
[meow](https://github.com/meow-edit/meow) — its keymap ships inside the
extension; override keys in `~/.codemeowrc` (`SPC c m` opens it, `SPC c M`
reloads it).

## Install settings + default extensions

```sh
curl https://raw.githubusercontent.com/chubbyhippo/vscodium-settings/refs/heads/main/install.sh | /usr/bin/env sh
```

## Install codemeow

1. Remove VSCodeVim if installed (both extensions conflict on the `type`
   command):

   ```sh
   codium --uninstall-extension vscodevim.vim
   ```

2. Build and side-load (needs node 24, or [mise](https://mise.jdx.dev);
   detects VSCodium's `~/.vscode-oss` on Linux/macOS and the Windows
   editors when run from WSL):

   ```sh
   git clone --depth 1 https://github.com/chubbyhippo/codemeow.git && cd codemeow && ./setup.sh
   ```

3. Restart the editor.

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
