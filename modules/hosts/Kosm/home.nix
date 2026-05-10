{ self, inputs, ... }: {
  flake.homeModules.KosmHome = { ... }: {
    imports = [
      self.homeModules.hmGit
      inputs.nix-index-database.homeModules.default
    ];

    home.username = "yharnam";
    home.homeDirectory = "/home/yharnam";
    home.stateVersion = "24.11";

    programs.home-manager.enable = true;
  };
}

#If another user is added then making a home-user would work:

# { self, ... }: {
#   flake.homeModules.TachyonHome*insert name here* = { ... }: {
#     imports = [                     ^
#       self.homeModules.hmVesktop    |
#     ];                 -------------             
#                        |         |
#     home.username = "user";      |
#     home.homeDirectory = "/home/user";
#     home.stateVersion = "24.11";

#     programs.home-manager.enable = true;
#   };
# }