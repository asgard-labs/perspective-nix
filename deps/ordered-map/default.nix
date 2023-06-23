{ lib
, stdenv
, fetchFromGitHub
, cmake
}:

stdenv.mkDerivation rec {
  pname = "ordered-map";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "Tessil";
    repo = "ordered-map";
    rev = "v${version}";
    hash = "sha256-cjgMftPNeNNL+K/4rFU8HpYU6yfPMp0k+GdRtdT75S8=";
  };

  nativeBuildInputs = [
    cmake
  ];

  meta = with lib; {
    description = "C++ hash map and hash set which preserve the order of insertion";
    homepage = "https://github.com/Tessil/ordered-map.git";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
