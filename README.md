# vscodium-settings
```sh
curl https://raw.githubusercontent.com/chubbyhippo/vscodium-settings/refs/heads/main/install.sh | /usr/bin/env sh
```
## Install default extensions
```sh
curl https://raw.githubusercontent.com/chubbyhippo/vscodium-settings/refs/heads/main/install-default-extensions.sh | /usr/bin/env sh
```
## Uninstall all extensions
```sh
codium --list-extensions | xargs -L 1 codium --uninstall-extension;codium --list-extensions | xargs -L 1 codium --uninstall-extension
```
## Install extensions
### clojure
```sh
curl https://raw.githubusercontent.com/chubbyhippo/vscodium-settings/refs/heads/main/extensions/clojure.sh | /usr/bin/env sh
```
### java
```sh
curl https://raw.githubusercontent.com/chubbyhippo/vscodium-settings/refs/heads/main/extensions/java.sh | /usr/bin/env sh
```
