{
  config,
  lib,
  pkgs,
  ...
}: {
  options.modules.home.theming = {
    enable = lib.mkEnableOption "GTK/Qt theming and cursor";
  };

  config = lib.mkIf config.modules.home.theming.enable {
    home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      name = "Adwaita";
      size = 24;
      package = pkgs.adwaita-icon-theme;
    };

    home.sessionVariables = {
      XCURSOR_THEME = "Adwaita";
      XCURSOR_SIZE = "24";
    };

    gtk = {
      enable = true;
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
    };

    qt = {
      enable = true;
      platformTheme.name = "gtk";
    };
  };
}
