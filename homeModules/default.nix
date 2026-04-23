{ lib, ... }:

{
  imports = [
    ./shell/bash.nix
    ./shell/fish.nix
    ./shell/starship.nix
    ./shell/git.nix
    ./theming/gtk.nix
    ./programs/packages.nix
    ./programs/symlinks.nix
    ./desktop/anki.nix
  ];
  #anki.enable = lib.mkDefault true;
  #fish.enable = lib.mkDefault true;
  #starship.enable = lib.mkDefault true;

}
