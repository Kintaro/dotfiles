{
  allowUnfree = true;
  steam.primus = true;
  steam.java = true;

  packageOverrides = pkgs:
    {
      w3m = pkgs.w3m.override { graphicsSupport = true; };
      boost = pkgs.boost.override { mpi = pkgs.openmpi; };
      scala = pkgs.scala.override { jre = pkgs.oraclejre8; };
      bumblebee = pkgs.bumblebee.override { nvidia_x11_i686 = pkgs.pkgsi686Linux.linuxPackages.nvidia_x11; };
    };
}
