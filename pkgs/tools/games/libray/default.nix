{ lib, pythonPackages, fetchPypi }:

with pythonPackages;

buildPythonApplication rec {
  pname = "libray";
  version = "0.0.10";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-6b5c0ef06385f0f22a9b316be7eb3d361eac6471e9571b46685adb8f012b517f=";
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
