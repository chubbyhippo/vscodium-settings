#!/usr/bin/env sh

# Initialize destination variables for settings.json and keybindings.json
settings_json_destination=
keybindings_json_destination=

# Detect the operating system and set file paths accordingly
case $(uname 2>/dev/null) in
Linux)
	# For Linux systems
	settings_json_destination=$HOME/.config/VSCodium/User/settings.json
	keybindings_json_destination=$HOME/.config/VSCodium/User/keybindings.json
	;;
Darwin)
	# For macOS systems
	settings_json_destination=$HOME/Library/Application\ Support/VSCodium/User/settings.json
	keybindings_json_destination=$HOME/Library/Application\ Support/VSCodium/User/keybindings.json
	;;
MINGW* | MSYS* | CYGWIN*)
	# For Windows systems using MinGW/MSYS/Cygwin
	case $(command -v codium 2>/dev/null) in
	*/scoop/apps/vscodium/*)
		# If VSCodium was installed via Scoop
		echo "vscodium was installed via Scoop."
		settings_json_destination=$HOME/scoop/apps/vscodium/current/data/user-data/User/settings.json
		keybindings_json_destination=$HOME/scoop/apps/vscodium/current/data/user-data/User/keybindings.json
		;;
	*)
		# Default VSCodium installation path in Windows
		settings_json_destination=$HOME/AppData/Roaming/VSCodium/User/settings.json
		keybindings_json_destination=$HOME/AppData/Roaming/VSCodium/User/keybindings.json
		;;
	esac
	;;
*)
	# If the operating system is unknown
	echo "Unknown Operating System" >&2
	exit 1
	;;
esac

# Print the destination paths for verification
printf '%s\n' "$settings_json_destination"
printf '%s\n' "$keybindings_json_destination"

RAW_SETTINGS_URL=https://raw.githubusercontent.com/chubbyhippo/vscodium-settings/refs/heads/main

# Download settings.json and keybindings.json using curl or wget
curl -k "$RAW_SETTINGS_URL/settings.json" -o "$settings_json_destination"
curl -k "$RAW_SETTINGS_URL/keybindings.json" -o "$keybindings_json_destination"

# Install basic VSCodium extensions
curl -k "$RAW_SETTINGS_URL/install-default-extensions.sh" | sh
