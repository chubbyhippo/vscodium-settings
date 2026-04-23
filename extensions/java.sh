#!/usr/bin/env sh

RAW_SETTINGS_URL=https://raw.githubusercontent.com/chubbyhippo/vscodium-settings/refs/heads/main
curl -k "$RAW_SETTINGS_URL/install-default-extensions.sh" | sh

codium --force --install-extension vscjava.vscode-java-pack
codium --force --install-extension vmware.vscode-boot-dev-pack
