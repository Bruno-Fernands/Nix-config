{
  config,
  lib,
  pkgs,
  zen-browser,
  helium,
  ...
}: {
  options.modules.nixos.commonPackages = {
    enable = lib.mkEnableOption "common system packages";
  };

  config = lib.mkIf config.modules.nixos.commonPackages.enable {
    programs.firefox.enable = true;

    environment.systemPackages = with pkgs; [
      alacritty
      helium.packages.x86_64-linux.default
      zen-browser.packages.x86_64-linux.default
    ];
  };
}
