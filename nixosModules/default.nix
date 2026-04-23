{ ... }:

{
  imports = [
    ./desktop/hyprland.nix
    ./desktop/display-manager.nix
    ./hardware/audio.nix
    ./hardware/bluetooth.nix
    ./system/locale.nix
    ./system/fonts.nix
    ./system/networking.nix
    ./system/users.nix
    ./programs/common.nix
  ];
}
