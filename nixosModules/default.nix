{...}: {
  imports = [
    ./desktop/hyprland.nix
    ./desktop/display-manager.nix
    ./desktop/waydroid.nix
    ./hardware/audio.nix
    ./hardware/bluetooth.nix
    ./hardware/nvidia.nix
    ./system/locale.nix
    ./system/fonts.nix
    ./system/networking.nix
    ./system/users.nix
    ./programs/common.nix
  ];
}
