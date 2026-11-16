{
  description = "Excalidraw development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            nodejs_20
            yarn
            git
            python3
          ];

          shellHook = ''
            echo "🎨 Excalidraw development environment"
            echo "Node.js version: $(node --version)"
            echo "Yarn version: $(yarn --version)"
            echo ""
            echo "Run 'yarn install' to install dependencies"
            echo "Run 'yarn start' to start the development server"
          '';
        };
      });
}
