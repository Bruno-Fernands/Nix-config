{
  config,
  lib,
  pkgs,
  ...
}: {
  options.modules.home.fish = {
    enable = lib.mkEnableOption "fish shell";
  };

  config = lib.mkIf config.modules.home.fish.enable {
    programs.fish = {
      enable = true;
      shellAliases = {
        nrs = "sudo nixos-rebuild switch --flake ~/nix-dots#sadam";
        vim = "nvim";
        cd = "z";
        dots = "cd ~/nix-dots";
        dotpush = "cd ~/nix-dots && git add . && git commit -m (date '+%Y-%m-%d %H:%M') && git push";
      };
      functions.rebuild = {
        body = ''
          pushd ~/nix-dots
          alejandra . &>/dev/null
          git diff -U0
          echo "NixOS Rebuilding..."
          if sudo nixos-rebuild switch --flake ~/nix-dots#sadam &>nixos-switch.log
            set gen (nixos-rebuild list-generations | grep True)
            set gen_num (echo $gen_line | awk '{print $1}')
            set gen_date (echo $gen_line | awk '{print $2, $3}')
            git commit -am "Generation: $gen_num  Date: $gen_date"
          else
            grep --color error nixos-switch.log
          end
          popd
        '';
      };
      plugins = [
        {
          name = "autopair";
          src = pkgs.fishPlugins.autopair.src;
        }
        {
          name = "sponge";
          src = pkgs.fishPlugins.sponge.src;
        }
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
