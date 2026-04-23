#!/usr/bin/env sh

RAW_SETTINGS_URL=https://raw.githubusercontent.com/chubbyhippo/vscodium-settings/refs/heads/main
curl -k "$RAW_SETTINGS_URL/install-default-extensions.sh" | sh

codium --force --install-extension ms-python.python
codium --force --install-extension ms-python.black-formatter
codium --force --install-extension ms-python.debugpy
codium --force --install-extension ms-python.pylint
codium --force --install-extension ms-toolsai.jupyter
