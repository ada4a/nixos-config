{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    probe-rs-tools
    cargo-binstall
    unzip
  ];

  users.groups = {
    dialout = { };
    plugdev = { };
  };
  users.users.ada4a.extraGroups = [
    "dialout"
    "plugdev"
  ];

  services.udev.extraRules = ''
    # udev rules to allow access to USB devices as a non-root user

    # nRF52840 Dongle in bootloader mode
    ATTRS{idVendor}=="1915", ATTRS{idProduct}=="521f", TAG+="uaccess"

    # nRF52840 Dongle applications
    ATTRS{idVendor}=="1209", TAG+="uaccess"

    # nRF52840 Development Kit
    ATTRS{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1", TAG+="uaccess"

    ${pkgs.lib.strings.readFile ./69-probe-rs.rules}
  '';
}
