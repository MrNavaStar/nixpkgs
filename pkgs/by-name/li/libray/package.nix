{ lib
, python3
, fetchPypi
}:

let
  pname = "libray";
  version = "0.0.10";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-a1wO8GOF8PIqmzFr5+s9Nh6sZHHpVxtGaFrbjwErUX8=";
  };

in
python3.pkgs.buildPythonApplication  {
  inherit pname version src;
  pyproject = true;

  propagatedBuildInputs = with python3.pkgs; [
    tqdm
    pycryptodome
    beautifulsoup4
    html5lib
    requests
    setuptools
  ];

  # Tests for this applicaiton do not run on NixOS, and binaries were
  # manually tested instead
  doCheck = false;

  meta = {
    description = "A Libre (FLOSS) Python application for unencrypting, extracting, repackaging, and encrypting PS3 ISOs";
    homepage = "https://pypi.org/project/libray";
    license = lib.licenses.lgpl3;
    maintainers = with lib.maintainers; [ maintainers.mrnavastar ];
  };
}
