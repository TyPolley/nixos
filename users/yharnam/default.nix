{ pkgs, lib, ... }:
{
    home.username = "yharnam";

    programs.git = {
        enable = true;
        settings = {
            user = {
                name  = "Ty Polley";
                email = "polleykia@gmail.com";
            };
        init.defaultBranch = "main";
        };
    };
}