{
  config,
  lib,
  pkgs,
  inputs,
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
      inputs.helium.packages.x86_64-linux.default
      inputs.zen-browser.packages.x86_64-linux.default
    ];
  };
}
