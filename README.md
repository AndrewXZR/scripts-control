# Touchpad, Volume, and Brightness Control Scripts

This repository contains a set of lightweight shell scripts to control various system features such as the touchpad, volume, and screen brightness. These scripts are designed to work in a minimalistic, suckless-style environment with `dwm`, but they can be easily adapted to other window managers or environments.

## Features

- **Touchpad Toggle**: Enables or disables the touchpad with a simple toggle.
- **Volume Control**: Increases, decreases, or mutes the volume.
- **Brightness Control**: Increases or decreases the screen brightness.

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/AndrewXZR/scripts-control
    cd scripts-control
    ```

2. Make the scripts executable:

    ```bash
    chmod +x touchpad.sh volume.sh brightness.sh
    ```

3. Optionally, move the scripts to a directory in your `PATH` for easy access:

    ```bash
    sudo mv touchpad.sh /usr/local/bin/
    sudo mv volume.sh /usr/local/bin/
    sudo mv brightness.sh /usr/local/bin/
    ```

## Usage

- **Touchpad Toggle**: Use the `touchpad.sh` script to toggle the touchpad on and off.

    ```bash
    ./touchpad.sh
    ```

- **Volume Control**: Use the `volume.sh` script to adjust the volume.

    - Increase volume:
    
        ```bash
        ./volume.sh up
        ```
    
    - Decrease volume:
    
        ```bash
        ./volume.sh down
        ```
    
    - Mute/unmute:
    
        ```bash
        ./volume.sh mute
        ```

- **Brightness Control**: Use the `brightness.sh` script to adjust the screen brightness.

    - Increase brightness:
    
        ```bash
        ./brightness.sh up
        ```
    
    - Decrease brightness:
    
        ```bash
        ./brightness.sh down
        ```

## Customization

You can customize the scripts to fit your specific hardware or preferences. Modify the scripts to adjust the behavior or add new options.

For example:
- Change the increment/decrement values for brightness or volume.
- Update the touchpad device name in the `touchpad.sh` script if your device is different from the default.

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.
