# modules/nixos/apps/vscode-server/default.nix
{ self, inputs, ... }: {
    flake.nixosModules.sysCode = { inputs, pkgs, ... }:

    {
        imports = [
            inputs.vscode-server.nixosModules.default
        ];

        services.vscode-server.enable = true;

        environment.systemPackages = with pkgs; [
            vscode
        ];
    };
}