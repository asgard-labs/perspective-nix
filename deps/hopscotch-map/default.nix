{ lib
, stdenv
, fetchFromGitHub
, cmake
}:

stdenv.mkDerivation rec {
  pname = "hopscotch-map";
  version = "2.3.0";

  src = fetchFromGitHub {
    owner = "Tessil";
    repo = "hopscotch-map";
    rev = "v${version}";
    hash = "sha256-VywWMY8VDzDozSVPE01lJxXDM9Yc6LtbbxcAwM/gVwQ=";
  };

  nativeBuildInputs = [
    cmake
  ];

  cmakeFlags = [
    "-DBUILD_SHARED_LIBS=true"
  ];

  meta = with lib; {
    description = "C++ implementation of a fast hash map and hash set using hopscotch hashing";
    homepage = "https://github.com/Tessil/hopscotch-map.git";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
