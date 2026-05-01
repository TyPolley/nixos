{ self, ... }: {

    flake.homeModules.hmGit = { input, ... }:
    {
        programs.git = {
            enable = true;
            settings.user = {
                name  = "Ty";
                email = "polleyty21@gmail.com";
            };
            signing.format = null;
        };
    };

}