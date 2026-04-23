{ config, lib, ... }:

{
  options.modules.nixos.networking = {
    enable   = lib.mkEnableOption "networking";
    hostname = lib.mkOption {
      type    = lib.types.str;
      default = "nixos";
      description = "System hostname";
    };
  };

  config = lib.mkIf config.modules.nixos.networking.enable {
    networking.hostName              = config.modules.nixos.networking.hostname;
    networking.networkmanager.enable = true;
  };
}
