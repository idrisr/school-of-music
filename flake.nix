{
  description = "my project description";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/23.05";

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      compiler = "ghc927";
      pkgs = import nixpkgs { system = system; };

      hPkgs = pkgs.haskell.packages."${compiler}";

      myDevTools = with hPkgs; [
        cabal-install
        fourmolu # Haskell formatter
        ghc # GHC compiler in the desired version (will be available on PATH)
        ghcid # Continuous terminal Haskell compile checker
        haskell-language-server # LSP server for editor
        hlint # Haskell codestyle checker
        hoogle # Lookup Haskell documentation
        hspec
        implicit-hie # auto generate LSP hie.yaml file from cabal
        pkgs.alsa-lib
        pkgs.zlib # External C library needed by some Haskell packages
        QuickCheck
        retrie # Haskell refactoring tool
        pkgs.fluidsynth
        pkgs.soundfont-fluid

      ];
      app = pkgs.haskell.packages.${compiler}.callPackage ./test.nix;

    in {
      apps.${system}.default = {
        type = "app";
        program = "${app { }}/bin/main";
      };

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = myDevTools;
        LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath myDevTools;
      };

      packages.${system}.default = app { };
    };
}

# setup 
# fluidsynth -a alsa -o midi.driver=alsa_seq -g 1.0 /nix/store/5q0p0bh0p983qqk5g73g5fc4lx6fj891-Fluid-3/share/soundfonts/FluidR3_GM2-2.sf2
# aconnect 14:0 128:0


