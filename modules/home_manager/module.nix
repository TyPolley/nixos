{ lib, ... }: {
  options.flake.homeModules = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.raw;
    default = {};
    description = "Wrapped Home Manager modules.";
  };
}