{
  config,
  lib,
  ...
}: {
  options.modules.home.bash = {
    enable = lib.mkEnableOption "bash configuration";
  };

  config = lib.mkIf config.modules.home.bash.enable {
    programs.bash = {
      enable = true;
      shellAliases = {
        nrs = "sudo nixos-rebuild switch --flake ~/nix-dots#sadam";
        vim = "nvim";
      };
      #      profileExtra = ''
      #        if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
      #          exec uwsm start -S hyprland-uwsm.desktop
      #        fi
      #      '';
    };
  };
}
