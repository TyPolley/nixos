{ self, inputs, ... }:

{
  flake.nixosModules.sysBasePackages = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      git
      vim
      wget
      comma
      yt-dlp
    ];
  };
}