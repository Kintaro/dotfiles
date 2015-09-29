with import <nixpkgs> { };

stdenv.mkDerivation rec {
  name = "feednix";

  meta = with stdenv.lib; {
    description = "NCurses based Feedly reader";
    homepage    = https://github.com/Jarkore/Feednix;
  };

  buildINputs = [ jsoncpp gnutls ncurses ];
  libPath = lib.makeLibraryPath [ jsoncpp gnutls ncurses ];

  src = fetchurl {
    url = "https://github.com/Jarkore/Feednix/archive/b0e2706588a18a429c30852ac9c1448152e46e26.zip";
    sha256 = "15sx1b63vib73n7xqzahrhlyqskam6kg4j9sjnkig0p2smr219q9";
  };
}
