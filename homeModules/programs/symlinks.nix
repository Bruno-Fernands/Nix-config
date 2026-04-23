{ config, lib, ... }:

{
  options.modules.home.symlinks = {
    enable = lib.mkEnableOption "dotfile symlinks";
  };

  config = lib.mkIf config.modules.home.symlinks.enable {
    xdg.configFile =
      let
        dotfiles       = "${config.home.homeDirectory}/nix-dots/config";
        create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
        configs = {
          hypr      = "hypr";
          nvim      = "nvim";
          foot      = "foot";
          waybar    = "waybar";
          fastfetch = "fastfetch";
          kitty     = "kitty";
        };
      in
      builtins.mapAttrs (name: subpath: {
        source    = create_symlink "${dotfiles}/${subpath}";
        recursive = true;
      }) configs;
  };
}
