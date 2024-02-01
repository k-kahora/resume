
{
  description = "A simple Python project with NumPy";

  inputs = {
  	 nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  	 nixgl.url = "github:guibou/nixGL";
	 nixgl.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, nixgl }: {
    devShell.x86_64-linux = with nixpkgs.legacyPackages.x86_64-linux; mkShell {
      buildInputs = [
	# nixgl.defaultPackage.x86_64-linux
	texlive.combined.scheme-full
	# latex
      ];

      # Optional: Set PYTHONPATH if needed
      shellHook = ''
        export PYTHONSTARTUP=./startup.py
      '';
    };
  };
  }