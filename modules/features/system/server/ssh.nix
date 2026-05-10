{ self, inputs, ... }:

{
  flake.nixosModules.sysSSH = { config, pkgs, lib, ... }:

  with lib;
  let
    cfg = config.modules.ssh;

    keys = builtins.fetchurl {
      url = "https://github.com/TyPolley.keys";
      sha256 = "0a2na1jg1kl5vvwy5sf2gcnc4a53a84qngcr0av5xpmdf1lyfc0d";
    };
  in
  {
    options.modules.ssh = {
      enable = mkEnableOption "ssh";
    };

    config = mkIf cfg.enable {
      services.openssh.enable = true;

      services.openssh.settings = {
        PermitRootLogin = mkForce "no";
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