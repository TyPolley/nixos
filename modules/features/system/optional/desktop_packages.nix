{ self, inputs, ... }:

{
  flake.nixosModules.sysDesktopPackages = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      vscode
      obsidian
      virt-manager
      vesktop
      spotify
      teams-for-linux
      prismlauncher
    ];
  };
}