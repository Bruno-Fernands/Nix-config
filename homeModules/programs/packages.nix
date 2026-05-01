{
  config,
  lib,
  pkgs,
  ...
}: {
  options.modules.home.packages = {
    enable = lib.mkEnableOption "home packages";
  };

  config = lib.mkIf config.modules.home.packages.enable {
    home.packages = with pkgs; [
      vim
      wget
      obsidian
      timewarrior
      git
      ntfs3g
      pavucontrol
      neovim
      alacritty
      ripgrep
      nil
      unzip
      nixpkgs-fmt
      nodejs
      gcc
      wofi
      nitch
      rofi
      pcmanfm
      obs-studio
      #stremio
      fastfetch
      tree
      bat
      btop
      kitty
      spotify
      emacs
      vesktop
      fzf
      mpv
      mpc
      mpd
      rmpc
      nautilus
      qbittorrent
      waybar
      yazi
      xwayland-satellite
      tldr
      man
      teams-for-linux
      alejandra
    ];
  };
}
