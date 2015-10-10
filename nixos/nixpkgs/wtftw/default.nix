{ stdenv, fetchgit, rustPlatform, libXinerama, libX11, xlibs, pkgconfig }:

with import <nixpkgs> { }; with rustPlatform; with xlibs;

buildRustPackage rec {
  #TODO add emacs support
  name = "wtftw";
  src = fetchgit {
    url = https://github.com/Kintaro/wtftw;
    rev = "6b6b1b4405922f6330b302700320ab5ff8732f43";
    sha256 = "d586136c4a40e97bca6f5d8b9e39eabd2d91b19df54c7f693894f75eebdaf85a";
  };

  depsSha256 = "13729lr1imzmi7ym6j2bqxi9d6vknxn85sbcyn12p4qiq1dra8iy";

  buildInputs = [ makeWrapper libXinerama libX11 pkgconfig ];
  libPath = lib.makeLibraryPath [ libXinerama libX11 ];

  preInstall = ''
    cargo update
  '';

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share/xsessions
    cp -p target/release/wtftw $out/bin/
    echo "[Desktop Entry]
        Name=wtftw
        Exec=$out/bin/wtftw
        Type=XSession
        DesktopName=wtftw" > $out/share/xsessions/wtftw.desktop
  '';

  meta = with stdenv.lib; {
    description = "A tiling window manager in Rust";
    homepage = https://github.com/Kintaro/wtftw;
    license = stdenv.lib.licenses.bsd3;
  };
}
