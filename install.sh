#!/usr/bin/env sh

# Initialize destination variables for settings.json and keybindings.json
settings_json_destination=""
keybindings_json_destination=""

# Detect the operating system and set file paths accordingly
case $(uname) in
    "Linux")
        # For Linux systems
        settings_json_destination="$HOME/.config/VSCodium/User/settings.json"
        keybindings_json_destination="$HOME/.config/VSCodium/User/keybindings.json"
        ;;
    "Darwin")
        # For macOS systems
        settings_json_destination="$HOME/Library/Application Support/VSCodium/User/settings.json"
        keybindings_json_destination="$HOME/Library/Application Support/VSCodium/User/keybindings.json"
        ;;
    "MINGW"*)
        # For Windows systems using MinGW
        case $(command -v code 2>/dev/null) in
            *"/scoop/apps/vscode/"*)
                # If VSCode was installed via Scoop
                echo "vscode was installed via Scoop."
                settings_json_destination="$HOME/scoop/apps/vscodium/current/data/user-data/User/settings.json"
                keybindings_json_destination="$HOME/scoop/apps/vscodium/current/data/user-data/User/keybindings.json"
                ;;
            *)
                # Default VSCode installation path in Windows
                settings_json_destination="$HOME/AppData/Roaming/VSCodium/User/settings.json"
                keybindings_json_destination="$HOME/AppData/Roaming/VSCodium/User/keybindings.json"
                ;;
        esac
        ;;
    *)
        # If the operating system is unknown
        echo "Unknown Operating System"
        ;;
esac

# Print the destination paths for verification
echo "$settings_json_destination"
echo "$keybindings_json_destination"

# Download settings.json and keybindings.json using curl or wget
if [ "$(command -v curl)" ]; then
    # Use curl if available
    curl -k https://raw.githubusercontent.com/chubbyhippo/vscodium-settings/refs/heads/main/settings.json -o "$settings_json_destination"
    curl -k https://raw.githubusercontent.com/chubbyhippo/vscodium-settings/refs/heads/main/keybindings.json -o "$keybindings_json_destination"
elif [ "$(command -v wget)" ]; then
    # Use wget if available
    wget https://raw.githubusercontent.com/chubbyhippo/vscodium-settings/refs/heads/main/settings.json -P "$settings_json_destination"
    wget https://raw.githubusercontent.com/chubbyhippo/vscodium-settings/refs/heads/main/keybindings.json -P "$keybindings_json_destination"
fi

# Install basic VSCode extensions by executing a remote script
curl -k https://raw.githubusercontent.com/chubbyhippo/vscodium-settings/refs/heads/main/install-extensions.sh | /usr/bin/env sh
