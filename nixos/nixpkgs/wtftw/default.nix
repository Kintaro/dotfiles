{ stdenv, fetchgit, cargo, rustPlatform, libXinerama, libX11, xlibs }:

with import <nixpkgs> { }; with rustPlatform; with xlibs;

buildRustPackage rec {
  #TODO add emacs support
  name = "wtftw";
  src = fetchgit {
    url = https://github.com/Kintaro/wtftw;
    rev = "ee15118ec599e15da6aa91f8b12b58816f7103e8";
    sha256 = "fef68055d5d7542da290c527f27a7ccd3caa05f04deeecd2ee2db2b300a9cb6b";
  };

  depsSha256 = "0nhcfimzhajvkfyl7m31d3spqdr7cw33yi4fff8sjd4cd9fn0gr6";

  buildInputs = [ makeWrapper libXinerama libX11 ];
  libPath = lib.makeLibraryPath [ libXinerama libX11 ];

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
