{ stdenv, fetchgit, cargo, rustPlatform, libXinerama, libX11, xlibs }:

with import <nixpkgs> { }; with rustPlatform; with xlibs;

buildRustPackage rec {
  #TODO add emacs support
  name = "wtftw";
  src = fetchgit {
    url = https://github.com/Kintaro/wtftw;
    rev = "70f6af7dbddad4354d39f415bc9caa4cc10049c0";
    sha256 = "634bbc2cb558f3d82da869f7e2c8b7a7cde8d65d0ba21d85230d2e3071b5df41";
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
