{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    # Build tools
    # Optional utilities


    pkgs.gcc
    pkgs.gnumake
    pkgs.pkg-config
    pkgs.m4
    pkgs.automake
    pkgs.autoconf
    pkgs.libtool
    pkgs.gnum4

    pkgs.libusb1
    pkgs.jimtcl

    pkgs.git
    pkgs.gnum4          # Needed by autom4te (usually included via autoconf)
  ];

  # Set environment variables so aclocal finds pkg-config macros
  shellHook = ''
    export ACLOCAL_PATH="${pkgs.pkg-config}/share/aclocal:${pkgs.autoconf}/share/aclocal:${pkgs.libtool}/share/aclocal"
  '';
}

