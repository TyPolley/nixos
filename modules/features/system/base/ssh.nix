{ self, inputs, ... }:

{
  flake.nixosModules.sysSSH = { config, pkgs, lib, ... }:

  with lib;
  let
    cfg = config.modules.ssh;

    keys = builtins.fetchurl {
      url = "https://github.com/TyPolley.keys";
      sha256 = "sha256-REPLACE_ME";
    };
  in
  {
    options.modules.ssh = {
      enable = mkEnableOption "ssh";
    };

    config = mkIf cfg.enable {
      services.openssh.enable = true;

      services.openssh.settings = {
        PermitRootLogin = lib.mkForce "no";
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        LogLevel = "VERBOSE";
      };

      users.users.yharnam.openssh.authorizedKeys.keyFiles = [
        keys
      ];
    };
  };
}