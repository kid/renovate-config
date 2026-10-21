{
  description = "Shared Renovate config and its postUpgradeTasks tooling";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];
    in
    {
      packages = forAllSystems (system: {
        refresh-nix-hash = nixpkgs.legacyPackages.${system}.callPackage ./refresh-nix-hash.nix { };
      });
    };
}
