{
  allowUnfree = true;
  steam.primus = true;
  steam.java = true;

  firefox = {
     enableGoogleTalkPlugin = true;
     enableAdobeFlash = true;
    };

  packageOverrides = pkgs:
  {
    w3m = pkgs.w3m.override { graphicsSupport = true; };
    boost = pkgs.boost.override { mpi = pkgs.openmpi; };
    scala = pkgs.scala.override { jre = pkgs.oraclejre8; };
    bumblebee = pkgs.bumblebee.override { nvidia_x11_i686 = pkgs.pkgsi686Linux.linuxPackages.nvidia_x11; };
    ncmpcpp = pkgs.ncmpcpp.override { visualizerSupport = true; clockSupport = true; };

    toml = pkgs.pythonPackages.buildPythonPackage rec {
      name = "toml-0.9.1";

      buildInputs = with pkgs.pythonPackages; [ pkgs.zlib ];
      doCheck = false;

      src = pkgs.fetchurl {
        url = "https://pypi.python.org/packages/source/a/async/${name}.tar.gz";
        sha256 = "1ks0g2cbnsj3i6sgind3d4sy0ia9ai4cr948wmbhdip53m7q6dg8";
      };
    };

    cargo030 = pkgs.stdenv.mkDerivation {
      name = "cargo-0.3.0";
      version = "0.3.0";

      src = pkgs.fetchurl {
        url = "https://static-rust-lang-org.s3.amazonaws.com/cargo-dist/2015-06-17/cargo-nightly-x86_64-unknown-linux-gnu.tar.gz";
        sha1 = "fnx2rf1j8zvrplcc7xzf89czn0hf3397";
      };

      dontStrip = true;

      installPhase = ''
      mkdir -p "$out"
      ./install.sh "--prefix=$out"
      rm "$out/lib/rustlib/components" \
      "$out/lib/rustlib/install.log" \
      "$out/lib/rustlib/rust-installer-version" \
      "$out/lib/rustlib/uninstall.sh" \
      "$out/lib/rustlib/manifest-cargo"
      '' + (if pkgs.stdenv.isLinux then ''
      patchelf --interpreter "${pkgs.stdenv.glibc}/lib/${pkgs.stdenv.cc.dynamicLinker}" \
      --set-rpath "${pkgs.stdenv.cc.cc}/lib/:${pkgs.stdenv.cc.cc}/lib64/:${pkgs.zlib}/lib" \
      "$out/bin/cargo"
      '' else "");
    };
  };
}
