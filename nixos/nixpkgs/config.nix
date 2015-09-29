{
  allowUnfree = true;
  steam.primus = true;
  steam.java = true;
  imports = [ ./feednix.nix ];

  packageOverrides = pkgs:
  {
    feednix = [ ./feednix.nix ];
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
  };
}
