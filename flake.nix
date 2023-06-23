{
  description = "Nix expressions for perspective library (https://www.perspective.finos.org)";

  inputs.flake-registry.url = github:asgard-labs/flake-registry;
  inputs.nixpkgs.follows = "flake-registry/nixpkgs";

  inputs.perspective.url = github:finos/perspective;
  inputs.perspective.flake = false;

  outputs = inputs:

    let

      system = "x86_64-linux";

      overlay = self: super: {
        sources = inputs;
        exprtk = self.callPackage ./deps/exprtk {};
        hopscotch-map = self.callPackage ./deps/hopscotch-map {};
        ordered-map = self.callPackage ./deps/ordered-map {};
        perspective-cpp = self.callPackage ./perspective/cpp {};
      };

      pkgs = import inputs.nixpkgs { inherit system; overlays = [ overlay ]; };

    in

      {

        inherit pkgs overlay;

        packages.${system}.default = pkgs.perspective-cpp;

      };
}
