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
      userName = "Bruno-Fernands";
      userEmail = "bruno.bf@ges.inatel.br";
      extraConfig = {
        core.sshCommand = "ssh -i ~/.ssh/id_ed25519";
        pull.rebase = false;
        init.defaultBranch = "main";
      };
    };
  };
}
