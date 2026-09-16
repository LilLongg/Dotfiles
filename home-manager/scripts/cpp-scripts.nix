{ stdenv }:
stdenv.mkDerivation {
  pname = "User cpp scripts";
  version = "2.0.0";
  src = ./.;

  installPhase = ''
    mkdir -p $out/bin

    g++ -O3 -std=c++23 $src/system-age.cc -o $out/bin/system-age
    g++ -O3 -std=c++23 $src/uptime-fmt.cc -o $out/bin/uptime-fmt
  '';
}
