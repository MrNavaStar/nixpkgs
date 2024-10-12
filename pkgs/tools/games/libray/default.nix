{ lib, pythonPackages, fetchPypi }:

with pythonPackages;

buildPythonApplication rec {
  pname = "libray";
  version = "0.0.10";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-a1wO8GOF8PIqmzFr5+s9Nh6sZHHpVxtGaFrbjwErUX8=";
  };
  nativeBuildInputs = [ setuptools-scm ];
  propagatedBuildInputs = [ tqdm pycryptodome requests beautifulsoup4 html5lib ];

  nativeCheckInputs = [ unittestCheckHook ];

  meta = with lib; {
    homepage = "https://pypi.org/project/libray/";
    description = "A Libre (FLOSS) Python application for unencrypting, extracting, repackaging, and encrypting PS3 ISOs";
    maintainers = [ maintainers.mrnavastar ];
    license = licenses.lgpl3;
    platforms = platforms.linux;
  };
}
