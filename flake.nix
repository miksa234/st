{
  description = "slock development shell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      shell = pkgs.zsh;

      devShells.${system}.default = pkgs.mkShell {
        # Compilers + build tools
        nativeBuildInputs = with pkgs; [
          gcc
          gnumake
          pkg-config
          ncurses
          fontconfig
          freetype
        ];

        # Libraries + headers
        buildInputs = with pkgs; [
          libX11
          libXft
        ];
      };
    };
}
