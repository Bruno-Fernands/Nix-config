{lib, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../nixosModules
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "25.11";

  modules.nixos = {
    locale.enable = true;
    networking = {
      enable = true;
      hostname = "computador";
    };
    audio.enable = true;
    bluetooth.enable = true;
    hyprland.enable = true;
    displayManager.enable = true;
    users.enable = true;
    commonPackages.enable = true;
    fonts.enable = true;
    nvidia.enable = true;
  };

  # Host-specific NTFS drives — too specific for a shared module
  boot.supportedFilesystems = ["ntfs"];
  fileSystems."/home/sadam/HD-1TB" = {
    device = "/dev/disk/by-uuid/FA78628D78624909";
    fsType = "ntfs-3g";
    options = ["rw" "uid=1000" "gid=100" "umask=0022" "nofail" "x-systemd.automount"];
  };
  fileSystems."/home/sadam/HD-2TB" = {
    device = "/dev/disk/by-uuid/9AA469E5A469C47B";
    fsType = "ntfs-3g";
    options = ["rw" "uid=1000" "gid=100" "umask=0022" "nofail" "x-systemd.automount"];
  };
}
