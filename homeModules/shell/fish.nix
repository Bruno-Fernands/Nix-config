{ config, lib, pkgs, ... }:

{
  options.modules.home.fish = {
    enable = lib.mkEnableOption "fish shell";
  };

  config = lib.mkIf config.modules.home.fish.enable {
    programs.fish = {
      enable = true;
      shellAliases = {
        nrs = "sudo nixos-rebuild switch --flake ~/nix-dots#sadam";
        vim = "nvim";
        cd  = "z";
        dots   = "cd ~/nix-dots";
        dotpush = "cd ~/nix-dots && git add . && git commit -m (date '+%Y-%m-%d %H:%M') && git push";
      };
      plugins = [
        { name = "autopair"; src = pkgs.fishPlugins.autopair.src; }
        { name = "sponge";   src = pkgs.fishPlugins.sponge.src; }
      ];
      interactiveShellInit = ''
        set -g fish_greeting ""
        fastfetch
      '';
    };

    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    programs.fzf = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
