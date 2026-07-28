{
  description = "FRSF: Federated Real-Time State Fabric project site";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    plinth = {
      url = "git+https://codeberg.org/caniko/plinth";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, plinth, ... }:
    let
      systems = [ "x86_64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
      mkSite = system:
        let
          pkgs = import nixpkgs { inherit system; };
          plinthProject = plinth.packages.${system}.plinth-project;
        in
          pkgs.stdenvNoCC.mkDerivation {
            pname = "frsf-site";
            version = "0.1.0";
            src = ./.;
            nativeBuildInputs = [ plinthProject ];
            phases = [ "buildPhase" "installPhase" ];
            buildPhase = ''
              plinth-project check --config "$src/website/plinth-project.toml"
              plinth-project build \
                --config "$src/website/plinth-project.toml" \
                --out public
            '';
            installPhase = ''
              mkdir -p "$out"
              cp -r public/. "$out/"
            '';
          };
    in
    {
      packages = forAllSystems (system:
        let site = mkSite system; in {
          inherit site;
          website = site;
          default = site;
        });
    };
}
