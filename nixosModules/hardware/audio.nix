{ config, lib, ... }:

{
  options.modules.nixos.audio = {
    enable = lib.mkEnableOption "PipeWire audio";
  };

  config = lib.mkIf config.modules.nixos.audio.enable {
    security.rtkit.enable = true;

    services.pipewire = {
      enable            = true;
      alsa.enable       = true;
      alsa.support32Bit = true;
      pulse.enable      = true;
      wireplumber.enable = true;
    };

    services.pipewire.wireplumber.extraConfig.bluetoothPolicy = {
      "monitor.bluez.properties" = {
        "bluez5.codecs"           = [ "sbc_xq" "aac" "sbc" ];
        "bluez5.enable-sbc-xq"   = true;
        "bluez5.enable-msbc"     = true;
        "bluez5.enable-hw-volume" = true;
        "bluez5.roles"            = [ "a2dp_sink" "a2dp_source" "hsp_hs" "hfp_hf" ];
      };
    };
  };
}
