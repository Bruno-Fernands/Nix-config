{ config, lib, pkgs, ... }:

{
  options.modules.nixos.fonts = {
    enable = lib.mkEnableOption "fonts";
  };

  config = lib.mkIf config.modules.nixos.fonts.enable {
    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      source-han-sans
      source-han-serif
    ];

    fonts.fontconfig = {
      enable = true;
      antialias = true;
      hinting = {
        enable = true;
        style = "slight";
      };
      subpixel = {
        rgba = "rgb";
        lcdfilter = "default";
      };
      defaultFonts = {
        sansSerif = [ "Noto Sans CJK SC" "Noto Sans" ];
        serif     = [ "Noto Serif CJK SC" "Noto Serif" ];
        monospace = [ "Noto Sans Mono" "Noto Sans Mono CJK SC" ];
      };
    };
  };
}
