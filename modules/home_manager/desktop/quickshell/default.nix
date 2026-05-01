{ self, ... }: {

    flake.homeModules.hmQuickshell = { inputs, ... }:
    {
        home.packages = [
            inputs.quickshell.packages."x86_64-linux".default
        ];
    };

}