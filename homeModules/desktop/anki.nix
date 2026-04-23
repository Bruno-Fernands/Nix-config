{ config, lib, pkgs, ... }:

{
  options.modules.home.anki = {
    enable = lib.mkEnableOption "Anki";
  };

  config = lib.mkIf config.modules.home.anki.enable {
    home.packages = [
      (pkgs.symlinkJoin {
        name  = "anki-wrapped";
        paths = [ pkgs.anki ];
        nativeBuildInputs = [ pkgs.makeWrapper ];
        postBuild = ''
          wrapProgram $out/bin/anki \
            --set QTWEBENGINE_CHROMIUM_FLAGS "--disable-gpu"
        '';
      })
    ];
  };
}
