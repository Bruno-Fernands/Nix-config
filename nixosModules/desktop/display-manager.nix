{
  config,
  lib,
  ...
}: {
  options.modules.nixos.displayManager = {
    enable = lib.mkEnableOption "Ly display manager";
  };

  config = lib.mkIf config.modules.nixos.displayManager.enable {
    services.xserver.enable = true;
    services.xserver.xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
    services.displayManager.ly.enable = true;
  };
}
