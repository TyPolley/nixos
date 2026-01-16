{ quickshell, ... }:
{
    home.packages = [
        quickshell.packages."x86_64-linux".default
    ];
}