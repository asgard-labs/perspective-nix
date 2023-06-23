{ lib
, stdenv
, pkg-config
, cmake
, boost
, howard-hinnant-date
, arrow-cpp
, re2
, srcOnly
, fetchFromGitHub
, callPackage
, exprtk
, hopscotch-map
, ordered-map
, sources
}:

stdenv.mkDerivation rec {
  pname = "perspective-cpp";
  version = "HEAD";

  src = "${sources.perspective}";

  sourceRoot = "source/cpp/perspective";

  patchPhase = ''
    cp ${./CMakeLists.txt} CMakeLists.txt
  '';

  nativeBuildInputs = [ cmake pkg-config ];

  buildInputs = [
    boost
    howard-hinnant-date
    arrow-cpp
    re2

    hopscotch-map
    ordered-map
    exprtk
  ];

  ARROW_SRC = "${srcOnly arrow-cpp}";
  EXPRTK = "${exprtk}";
  ORDERED_MAP = "${ordered-map}";

  meta = with lib; {
    description = "A data visualization and analytics component, especially well-suited for large and/or streaming datasets";
    homepage = "https://github.com/finos/perspective?dir=cpp/perspective";
    license = licenses.asl20;
    maintainers = with maintainers; [ ];
  };
}
