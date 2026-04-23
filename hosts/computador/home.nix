{...}: {
  imports = [../../homeModules];

  home.username = "sadam";
  home.homeDirectory = "/home/sadam";
  home.stateVersion = "25.11";

  modules.home = {
    bash.enable = false;
    theming.enable = true;
    packages.enable = true;
    symlinks.enable = true;
    anki.enable = true;
    fish.enable = true;
    starship.enable = true;
    git.enable = true;
  };
}
