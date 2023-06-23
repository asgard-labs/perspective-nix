{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "exprtk";
  version = "0.0.2";

  src = fetchFromGitHub {
    owner = "ArashPartow";
    repo = "exprtk";
    rev = version;
    hash = "sha256-ZV5nS6wEbKfzXhfXEtVlkwaEtxpTOYQaGlaxKx3FIvE=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/include
    cp $src/exprtk.hpp $out/include/
  '';

  meta = with lib; {
    description = "C++ Mathematical Expression Parsing And Evaluation Library https://www.partow.net/programming/exprtk/index.html";
    homepage = "https://github.com/ArashPartow/exprtk.git";
    license = with licenses; [ ];
    maintainers = with maintainers; [ ];
  };
}
