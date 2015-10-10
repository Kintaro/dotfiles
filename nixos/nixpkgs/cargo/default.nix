with import <nixpkgs> { };

pkgs.rustPlatform.buildRustPackage rec {
  name = "cargo030";
  version = "0.3.0"

  src = fetchgit {
    url = "https://github.com/rust-lang/cargo.git";
    rev = "refs/tags/0.3.0";
    sha256 = "0p7p7yivydjkpqb53a8i7pjl719z3gxa6czi0255ccwsh6n9z793";
  };

  depsSha256 = "1sgdr2akd9xrfmf5g0lbf842b2pdj1ymxk37my0cf2x349rjsf0w";

  buildInputs = [ file curl pkgconfig python openssl cmake zlib ];

  configurePhase = ''
    ./configure --enable-optimize --prefix=$out --local-cargo=${cargo}/bin/cargo
  '';

  buildPhase = "make";

  postInstall = ''
    rm "$out/lib/rustlib/components" \
       "$out/lib/rustlib/install.log" \
       "$out/lib/rustlib/rust-installer-version" \
       "$out/lib/rustlib/uninstall.sh" \
       "$out/lib/rustlib/manifest-cargo"
  '';

  # Disable check phase as there are lots of failures (some probably due to
  # trying to access the network).
  doCheck = false;

  installPhase = ''
    make install
    ${postInstall}
  '';
}
