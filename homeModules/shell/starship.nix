{ config, lib, ... }:

{
  options.modules.home.starship = {
    enable = lib.mkEnableOption "starship prompt";
  };

  config = lib.mkIf config.modules.home.starship.enable {
    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        format = "$username$hostname 福 $directory$git_branch$git_status$character";
        add_newline = false;

        username = {
          format    = "[$user]($style)";
          style_user = "bold cyan";
          show_always = true;
        };

        hostname = {
          format    = "[@$hostname]($style) ";
          style     = "bold cyan";
          ssh_only  = false;
        };

        directory = {
          format            = "[$path]($style) ";
          style             = "bold blue";
          truncation_length = 3;
          truncate_to_repo  = false;
        };

        git_branch = {
          format = "[$symbol$branch]($style) ";
          symbol = " ";
          style  = "bold purple";
        };

        git_status = {
          format    = "([$all_status$ahead_behind]($style)) ";
          style     = "bold red";
          modified  = "!";
          untracked = "?";
          staged    = "+";
          deleted   = "✘";
          ahead     = "⇡$count";
          behind    = "⇣$count";
        };

        character = {
          success_symbol = "[❯](bold green)";
          error_symbol   = "[❯](bold red)";
        };
      };
    };
  };
}
