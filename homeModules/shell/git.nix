{
  config,
  lib,
  ...
}: {
  options.modules.home.git = {
    enable = lib.mkEnableOption "git configuration";
  };

  config = lib.mkIf config.modules.home.git.enable {
    programs.git = {
      enable = true;
      settings.user.name = "Bruno-Fernands";
      settings.user.email = "bruno.bf@ges.inatel.br";
      settings = {
        core.sshCommand = "ssh -i ~/.ssh/id_ed25519";
        pull.rebase = false;
        init.defaultBranch = "main";
      };
    };
  };
}
