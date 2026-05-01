{
  config,
  lib,
  pkgs,
  ...
}: {
  options.modules.nixos.waydroid = {
    enable = lib.mkEnableOption "Waydroid Android container";
  };

  config = lib.mkIf config.modules.nixos.waydroid.enable {
    virtualisation.waydroid.enable = true;
    networking.nftables.enable = true;

    environment.systemPackages = with pkgs; [
      waydroid-helper
      wl-clipboard
    ];

    systemd = {
      packages = [pkgs.waydroid-helper];
      services.waydroid-mount.wantedBy = ["multi-user.target"];
    };

    # Required for Nvidia GPUs
    environment.etc."waydroid/waydroid_base.prop".text = ''
      ro.hardware.gralloc=default
      ro.hardware.egl=swiftshader
      sys.use_memfd=true
      persist.waydroid.width=1920
      persist.waydroid.height=1080
      persist.waydroid.density=240
    '';
  };
}
