{ config, pkgs, ... }:
{
  # Allow unfree (needed for some packages like vivaldi, vesktop, etc.)
  #nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    vscode
    obsidian
    vagrant
    virt-manager
    vesktop
    spotify
    bottles
    teams-for-linux
    prismlauncher
    yt-dlp
    comma

    
  ];

  # --- PATCHES / NOTES --- ᕙ(⇀‸↼‶)ᕗ

  # If Vivaldi misbehaves on Plasma6, the following override is useful:
  # environment.systemPackages = (with pkgs; [
  #   git vscode obsidian vagrant virt-manager vesktop
  #   (vivaldi.overrideAttrs (old: {
  #     dontWrapQtApps = false;
  #     dontPatchELF = true;
  #     nativeBuildInputs = old.nativeBuildInputs ++ [ pkgs.kdePackages.wrapQtAppsHook ];
  #   }))
  # ]);
}
