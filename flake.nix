{
  description = "Farsif: Federated Real-Time State Fabric project site";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    plinth = {
      url = "git+https://github.com/caniko/plinth";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, plinth, ... }:
    let
      systems = [ "x86_64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (system:
        let
          site = plinth.lib.${system}.mkProjectSite {
            pname = "farsif-site";
            domain = "farsif.tartanoglu.com";
            configPath = ./website/plinth-project.toml;
          };
        in {
          inherit site;
          website = site;
          default = site;
        });
    };
}
