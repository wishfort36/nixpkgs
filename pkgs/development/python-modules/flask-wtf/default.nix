{ stdenv, fetchPypi, buildPythonPackage, flask, wtforms, nose }:

buildPythonPackage rec {
  pname = "Flask-WTF";
  version = "0.14.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "d417e3a0008b5ba583da1763e4db0f55a1269d9dd91dcc3eb3c026d3c5dbd720";
  };

  propagatedBuildInputs = [ flask wtforms nose ];

  doCheck = false; # requires external service

  meta = with stdenv.lib; {
    description = "Simple integration of Flask and WTForms.";
    license = licenses.bsd3;
    maintainers = [ maintainers.mic92 ];
    homepage = "https://github.com/lepture/flask-wtf/";
  };
}
