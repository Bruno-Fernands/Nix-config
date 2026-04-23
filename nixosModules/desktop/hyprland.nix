{
  config,
  lib,
  ...
}: {
  options.modules.nixos.hyprland = {
    enable = lib.mkEnableOption "Hyprland compositor";
  };

  config = lib.mkIf config.modules.nixos.hyprland.enable {
    programs.hyprland = {
      enable = true;
      #      withUWSM        = true;
      xwayland.enable = true;
    };
    programs.dms-shell.enable = true;
    services.gvfs.enable = true;
    services.udisks2.enable = true;
  };
}
