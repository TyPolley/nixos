{ self, inputs, ... }:

{
  flake.nixosModules.sysDesktopPackages = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      obsidian
      virt-manager
      vesktop
      spotify
      teams-for-linux
      prismlauncher
      r2modman
      obs-studio
      discord
    ];
  };
}