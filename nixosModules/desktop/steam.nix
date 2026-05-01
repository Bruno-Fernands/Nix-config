{
  config,
  lib,
  ...
}: {
  options.modules.nixos.steam = {
    enable = lib.mkEnableOption "Steam";
  };

  config = lib.mkIf config.modules.nixos.steam.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = false;
    };

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
