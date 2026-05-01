{
  config,
  lib,
  pkgs,
  ...
}: {
  options.modules.home.emacs = {
    enable = lib.mkEnableOption "Emacs";
  };

  config = lib.mkIf config.modules.home.emacs.enable {
    home.packages = [
      pkgs.emacs
    ];
    programs.emacs = {
    };
  };
}
