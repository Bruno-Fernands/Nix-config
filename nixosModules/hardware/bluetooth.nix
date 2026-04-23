{ config, lib, ... }:

{
  options.modules.nixos.bluetooth = {
    enable = lib.mkEnableOption "Bluetooth support";
  };

  config = lib.mkIf config.modules.nixos.bluetooth.enable {
    hardware.bluetooth.enable = true;
    hardware.bluetooth.settings = {
      General = {
        Enable       = "Source,Sink,Media,Socket";
        Experimental = true;
      };
    };
    services.blueman.enable = true;
  };
}
