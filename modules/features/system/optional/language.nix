{ self, inputs, ... }: {

    flake.nixosModules.sysLanguage = { config, pkgs, ... }:

    {
        i18n.inputMethod = {
            enable = true;
            type = "fcitx5";
        };

        environment.systemPackages = with pkgs; [
            maliit-keyboard
        ];
    
    };

}