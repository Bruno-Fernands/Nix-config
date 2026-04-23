{ config, lib, pkgs, ... }:

{
  options.modules.nixos.users = {
    enable = lib.mkEnableOption "user accounts";
  };

  config = lib.mkIf config.modules.nixos.users.enable {
    users.users.sadam = {
      isNormalUser = true;
      description  = "sadam";
      extraGroups  = [ "networkmanager" "wheel" ];
      shell        = pkgs.fish;
    };
    programs.fish.enable = true;
  };
}
