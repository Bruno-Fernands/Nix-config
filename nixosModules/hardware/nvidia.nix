{
  config,
  lib,
  ...
}: {
  options.modules.nixos.nvidia = {
    enable = lib.mkEnableOption "Nvidia drivers";
  };

  config = lib.mkIf config.modules.nixos.nvidia.enable {
    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    };

    hardware.graphics.enable = true;
  };
}
